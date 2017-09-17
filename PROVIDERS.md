# Twitter

Based on: [Twitter](https://github.com/sferik/twitter)

```ruby
social_posting = SocialPosting::Client.new(
                   twitter: {
                     access_token: 'access_token',
                     access_token_secret: 'access_token_secret'
                   }
                 )

social_posting.to(:twitter, 'text', 'image')
```

Success:
```ruby
[
  {
    twitter: {
      status: :ok,
      response: {}
    }
  }
]
```

Failure:
```ruby
[
  {
    twitter: {
      status: :error,
      response: ''
    }
  }
]
```

Settings:
```ruby
SocialPosting::Settings.configure do |config|
  config.providers.twitter = {
    consumer_key: 'your_consumer_key',
    consumer_secret: 'your_consumer_secret'
  }
end
```

# Facebook

Based on: [Koala](https://github.com/arsduo/koala)

```ruby
social_posting = SocialPosting::Client.new(
                   facebook: {
                     access_token: 'access_token'
                   }
                 )

social_posting.to(:facebook, 'text', 'image')
```

Success:
```ruby
[
  {
    facebook: {
      status: :ok,
      response: {}
    }
  }
]
```

Failure:
```ruby
[
  {
    facebook: {
      status: :error,
      response: ''
    }
  }
]
```
