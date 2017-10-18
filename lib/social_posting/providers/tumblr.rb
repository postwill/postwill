module SocialPosting
  module Providers
    class Tumblr < Base
      def initialize(options)
        @client ||= ::Tumblr::Client.new(
          consumer_key: credentials[:consumer_key],
          consumer_secret: credentials[:consumer_secret],
          oauth_token: options[:access_token],
          oauth_token_secret: options[:access_token_secret]
        )
      end

      private

      def post(options)
        image = options[:image]
        text = options[:text]
        title = options[:title]
        user = options[:user]

        if image
          result = client.photo(user, data: [image], caption: text)
        else
          result = client.text(user, body: text, title: title)
        end

        response(result)
      end

      def credentials
        SocialPosting::Settings.config.providers.tumblr
      end

      def response(result)
        raise Exception, result['errors'] unless result.dig('id')
        result
      end
    end
  end
end
