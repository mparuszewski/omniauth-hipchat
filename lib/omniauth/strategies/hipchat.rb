require 'omniauth/strategies/oauth2'
require 'base64'

module OmniAuth
  module Strategies
    class Hipchat < OmniAuth::Strategies::OAuth2
      option :name, 'hipchat'

      option :authorize_options, [:scope]

      option :client_options, {
        site: 'https://api.hipchat.com',
        token_url: '/v2/oauth/token',
        authorize_url: 'https://www.hipchat.com/users/authorize'
      }

      uid { raw_info['owner']['id'] }

      info do
        {
          name: raw_info['owner'].to_h['name'],
          email: user_info['email'],
          mention_name: raw_info['owner'].to_h['mention_name'],
          roles: user_info['roles'],
          client_name: raw_info['client'].to_h['name'],
          room: raw_info['client'].to_h['room'],
          title: user_info['title'],
          image: user_info['photo_url'],
          group_avatar: group_info['avatar_url'],
          group_domain: group_info['subdomain'],
          group_id: access_token['group_id'],
          group: group_info['name'],
          plan: group_info['plan'].to_h['type'],
          user_id: raw_info['owner'].to_h['id'],
          is_group_admin: user_info['is_group_admin'],
          xmpp_jid: user_info['xmpp_jid'],
          time_zone: user_info['timezone']
        }
      end

      extra do
        {
          raw_info: raw_info,
          user_info: user_info,
          group_info: group_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/v2/oauth/token/#{access_token.token}").parsed
      end

      def user_info
        return {} unless group_info_allowed?
        @user_info ||= access_token.get("/v2/user/#{raw_info['owner']['id']}").parsed
      end

      def group_info
        return {} unless group_info_allowed?
        @group_info ||= access_token.get("/v2/group/#{access_token['group_id']}").parsed
      end

      def build_access_token
        options.token_params.merge!(:headers => {'Authorization' => basic_auth_header })
        super
      end

      def basic_auth_header
        "Basic " + Base64.strict_encode64("#{options[:client_id]}:#{options[:client_secret]}")
      end

      def group_info_allowed?
        return false unless options['scope']
        group_info_scopes = ['view_room']
        scopes = options['scope'].split(' ')
        (scopes & group_info_scopes).any?
      end
    end
  end
end
