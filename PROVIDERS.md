# Twitter

Based on: [Twitter](https://github.com/sferik/twitter)

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
    response: {} # Response data
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

social_posting.to(:facebook, text: 'text', image: 'image')
```

Success:
```ruby
{
  facebook: {
    status: :ok,
    response: {} # Response data
  }
}
```

Failure:
```ruby
{
  facebook: {
    status: :error,
    response: '' # String error message
  }
}
```

# Pinterest

Based on: [PinterestApi](https://github.com/realadeel/pinterest-api)

```ruby
social_posting = SocialPosting::Client.new(
                   pinterest: {
                     access_token: 'access_token'
                   }
                 )

# Reqired: [board_id image image_url]
# Optional: [text link]

social_posting.to(:pinterest, text: 'text', image: 'image', board_id: 'board_id', link: 'link')
# OR
social_posting.to(:pinterest, text: 'text', image_url: 'image_url', board_id: 'board_id', link: 'link')
```

Success:
```ruby
{
  pinterest: {
    status: :ok,
    response: {
      'data' => {
        'url' => 'PIN_LINK',
        'note' => 'text',
        'link' => 'LINK',
        'id' => 'PIN_ID'
      }
    }
  }
}
```

Failure:
```ruby
{
  pinterest: {
    status: :error,
    response: '' # String error message
  }
}
```

# Tumblr

Based on: [TumblrClient](https://github.com/tumblr/tumblr_client)

```ruby
SocialPosting::Settings.configure do |config|
  config.providers.tumblr = {
    consumer_key: 'consumer_key',
    consumer_secret: 'consumer_secret'
  }
end

social_posting = SocialPosting::Client.new(
                   tumblr: {
                     access_token: 'access_token',
                     access_token_secret: 'access_token_secret'
                   }
                 )

# Reqired: [user_nickname text image title]

social_posting.to(:tumblr, text: 'text', image: 'image', user: 'user_nickname')
# or
social_posting.to(:tumblr, text: 'text', title: 'title', user: 'user_nickname')
```

Success:
```ruby
{
  tumblr: {
    status: :ok,
    response: {
      {
        'id' => 'POST_ID'
      }
    }
  }
}
```

Failure:
```ruby
{
  tumblr: {
    status: :error,
    response: '' # String error message
  }
}
```
