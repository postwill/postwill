module SocialPosting
  module Providers
    module GooglePlus
      class Client < Base
        attr_reader :token, :client

        def initialize(options)
          @token = Token.new(options)
          # @client = Google::Test.new(token.authorization)
        end

        private

        def post(text, image)
        end
      end
    end
  end
end
