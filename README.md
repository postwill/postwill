# Postwill

[![Gem Version](https://badge.fury.io/rb/postwill.svg)](https://badge.fury.io/rb/postwill)
[![CircleCI](https://circleci.com/gh/postwill/postwill/tree/master.svg?style=svg)](https://circleci.com/gh/postwill/postwill/tree/master)
[![Maintainability](https://api.codeclimate.com/v1/badges/16f924433bfc8b8ebd6b/maintainability)](https://codeclimate.com/github/postwill/postwill/maintainability)

Posting to the most popular social media

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'postwill'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install postwill

## Usage

List of available providers is [here](https://github.com/postwill/postwill/blob/master/PROVIDERS.md).

### Single provider

```ruby
postwill = Postwill::Client.new(
                   twitter: {
                     access_token: 'access_token',
                     access_token_secret: 'access_token_secret'
                   }
                 )

postwill.to(:twitter, text: 'text', image: 'image')
```

Success:
```ruby
{
  twitter: {
    status: :ok,
    response: {} # Hash of response data depends on provider
  }
}
```

Failure:
```ruby
{
  twitter: {
    status: :error,
    response: '' # String error message
  }
}
```

Application credentials

`config/initializers/postwill.rb`
```ruby
Postwill::Settings.configure do |config|
  config.providers.twitter = {
    consumer_key: 'your_consumer_key',
    consumer_secret: 'your_consumer_secret'
  }
end
```

### Multiple providers

```ruby
postwill = Postwill::Client.new(
                   twitter: {
                     access_token: 'access_token',
                     access_token_secret: 'access_token_secret'
                   },
                   facebook: {
                     access_token: 'access_token'
                   }
                 )

postwill.to(%i[twitter facebook], text: 'text', image: 'image')
```

Result:
```ruby
{
  twitter: {
    status: :ok,
    response: {} # Response data
  },
  facebook: {
    status: :ok,
    response: {} # Response data
  }
}
```

Application credentials(for providers which need them)

`config/initializers/postwill.rb`
```ruby
Postwill::Settings.configure do |config|
  config.providers.twitter = {
    consumer_key: 'your_consumer_key',
    consumer_secret: 'your_consumer_secret'
  }
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/postwill/postwill.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
