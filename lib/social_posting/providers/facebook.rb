module SocialPosting
  module Providers
    class Facebook < Base
      def initialize(options)
        @client ||= ::Koala::Facebook::API.new(options[:access_token])
      end

      private

      def post(text, image)
        if image
          client.put_picture(image, { message: text })
        else
          client.put_connections('me', 'feed', message: text)
        end
      end
    end
  end
end
