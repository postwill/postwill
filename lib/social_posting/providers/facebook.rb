module SocialPosting
  module Providers
    class Facebook < Base
      def initialize(options)
        @client ||= ::Koala::Facebook::API.new(options[:access_token])
      end

      private

      def post(options)
        image = options[:image]
        text = options[:text]

        if image
          client.put_picture(image, { message: text })
        else
          client.put_connections('me', 'feed', message: text)
        end
      end
    end
  end
end
