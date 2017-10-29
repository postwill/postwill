module Postwill
  module Providers
    class Twitter < Base
      def initialize(options)
        @client ||= ::Twitter::REST::Client.new do |config|
          config.consumer_key = credentials[:consumer_key]
          config.consumer_secret = credentials[:consumer_secret]
          config.access_token = options[:access_token]
          config.access_token_secret = options[:access_token_secret]
        end
      end

      private

      def post(options)
        image = File.open(options[:image]) if options[:image]
        text = options[:text]

        response = image ? client.update_with_media(text, image) : client.update(text)
        response.to_h
      end

      def credentials
        Postwill::Settings.config.providers.twitter
      end
    end
  end
end
