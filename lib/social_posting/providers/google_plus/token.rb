module SocialPosting
  module Providers
    module GooglePlus
      class Token
        TOKEN_CREDENTIALS_URI = 'https://www.googleapis.com/oauth2/v3/token'
        OAUTH_URI = URI('https://accounts.google.com/o/oauth2/token')

        attr_reader :refresh_token, :client_id, :client_secret, :scope

        def initialize(options)
          @refresh_token = options[:refresh_token]
          @client_id = options[:client_id]
          @client_secret = options[:client_secret]
          @scope = parse_scope(options[:scope])

          authorization.fetch_access_token!
        end

        def authorization
          @authorization ||= Signet::OAuth2::Client.new(
            scope: scope,
            refresh_token: refresh_token,
            client_id: client_id,
            client_secret: client_secret,
            token_credential_uri: TOKEN_CREDENTIALS_URI
          )
        end

        def credentials
          {
            refresh_token: refresh_token,
            client_id:     client_id,
            client_secret: client_secret,
            access_token:  authorization.access_token,
            expires_in:    authorization.expires_in,
            id_token:      authorization.id_token
          }
        end

        private

        def parse_scope(*scopes)
          scopes.flatten.map { |scope| "https://www.googleapis.com/auth/#{scope}" }
        end
      end
    end
  end
end
