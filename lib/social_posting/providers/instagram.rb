module SocialPosting
  module Providers
    class Instagram < Base
      def initialize(options)
        @client ||= ::Instagram::Client.new(options[:username], options[:password])
      end

      private

      def post(options)
        image = options[:image]
        text = options[:text]

        client.upload_photo(image, text)
      end
    end
  end
end
