module SocialPosting
  module Providers
    module GooglePlus
      class Token
        OAUTH_URI = URI('https://accounts.google.com/o/oauth2/token')

        attr_accessor :access_token, :expires_at, :id_token, :expires_in, :token_type
        attr_reader :refresh_token, :client_id, :client_secret, :callback_url

        def initialize(options)
          @refresh_token = options[:refresh_token]
          @client_id = options[:client_id]
          @client_secret = options[:client_secret]
          @callback_url = options[:callback_url]

          refresh!
        end

        def authorization
          Signet::OAuth2::Client.new(credentials)
        end

        def credentials
          {
            refresh_token: refresh_token,
            client_id:     client_id,
            client_secret: client_secret,
            access_token:  access_token,
            expires_in:    expires_in,
            id_token:      id_token,
            token_type:    token_type
          }
        end

        private

        def refresh!
          request = Net::HTTP.post_form(OAUTH_URI, credentials.merge(grant_type: 'refresh_token'))
          data = JSON.parse(request.body)
          self.access_token = data['access_token']
          self.expires_in = data['expires_in']
          self.id_token = data['id_token']
          self.token_type = data['token_type']
        end
      end
    end
  end
end
