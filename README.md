# Omniauth::Hipchat

This Gem contains the HipChat strategy for OmniAuth.

[![Gem Version](https://badge.fury.io/rb/omniauth-hipchat.svg)](http://badge.fury.io/rb/omniauth-hipchat)

## Before You Begin

You should have already installed OmniAuth into your app; if not, read the [OmniAuth README](https://github.com/intridea/omniauth) to get started.

Now read documentation about [HipChat integrations](https://www.hipchat.com/docs/apiv2/addons) and create an application. Take note of your API keys.

## Using This Strategy

First start by adding this gem to your Gemfile:

```ruby
gem 'omniauth-hipchat'
```

If you need to use the latest HEAD version, you can do so with:

```ruby
gem 'omniauth-hipchat', github: 'pinoss/omniauth-hipchat'
```

Next, tell OmniAuth about this provider. For a Rails app, your `config/initializers/omniauth.rb` file should look like this:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :hipchat, "API_KEY", "API_SECRET", scope: "view_group admin_group"
end
```

Replace `"API_KEY"` and `"API_SECRET"` with the appropriate values you obtained [earlier](https://www.hipchat.com/docs/apiv2/addons).

If you are using [Devise](https://github.com/plataformatec/devise) then it will look like this:

```ruby
Devise.setup do |config|
  # other stuff...

  config.omniauth :hipchat, ENV["HIPCHAT_APP_ID"], ENV["HIPCHAT_APP_SECRET"], scope: 'view_group admin_group'

  # other stuff...
end
```

HipChat lets you combine and choose from a [few different scopes](https://www.hipchat.com/docs/apiv2/auth#scopes).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Special Thanks

Many thanks to the [omniauth-slack](https://github.com/CanCanCommunity/cancancan/contributors) and [omniauth-reddit contributors](https://github.com/CanCanCommunity/cancancan/contributors). This strategy was inspired by Omniauth Slack and Reddit strategies.