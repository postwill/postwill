module SocialPosting
  module Providers
    class Base
      attr_reader :client

      def call(options = {})
        Dry::Monads::Right(post(options))
      rescue Exception => error
        Dry::Monads::Left(error)
      end

      private

      def post(options)
        raise NotImplementedError
      end
    end
  end
end
