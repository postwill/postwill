module SocialPosting
  module Providers
    class Pinterest < Base
      def initialize(options)
        @client ||= ::Pinterest::Client.new(options[:access_token])
      end

      private

      def post(options)
        params = {
          board: options[:board_id],
          note: options[:text],
          link: options[:link],
          image_url: options[:image_url],
          image: options[:image]
        }.compact

        response(client.create_pin(params).to_h)
      end

      def response(result_post)
        raise Exception, result_post['message'] unless result_post.dig('data', 'id')
        result_post
      end
    end
  end
end
