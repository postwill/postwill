# SocialPosting

Posting to the most popular social media

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'social_posting'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install social_posting

## Usage

List of available providers is [here](https://github.com/postwill/social_posting/blob/master/PROVIDERS.md).

### Single provider

```ruby
social_posting = SocialPosting::Client.new(
                   twitter: {
                     access_token: 'access_token',
                     access_token_secret: 'access_token_secret'
                   }
                 )

social_posting.to(:twitter, text: 'text', image: 'image')
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

`config/initializers/social_posting.rb`
```ruby
SocialPosting::Settings.configure do |config|
  config.providers.twitter = {
    consumer_key: 'your_consumer_key',
    consumer_secret: 'your_consumer_secret'
  }
end
```

### Multiple providers

```ruby
social_posting = SocialPosting::Client.new(
                   twitter: {
                     access_token: 'access_token',
                     access_token_secret: 'access_token_secret'
                   },
                   facebook: {
                     access_token: 'access_token'
                   }
                 )

social_posting.to(%i[twitter facebook], text: 'text', image: 'image')
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

`config/initializers/social_posting.rb`
```ruby
SocialPosting::Settings.configure do |config|
  config.providers.twitter = {
    consumer_key: 'your_consumer_key',
    consumer_secret: 'your_consumer_secret'
  }
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/postwill/social_posting.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
