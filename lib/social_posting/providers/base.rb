module SocialPosting
  module Providers
    class Base
      attr_reader :client

      def call(text = nil, image = nil)
        Dry::Monads::Right post(text, image)
      rescue Exception => e
        Dry::Monads::Left e
      end

      private

      def post(text, image)
        raise NotImplementedError
      end
    end
  end
end
