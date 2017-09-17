module SocialPosting
  class Response
    def self.call(provider, type, value)
      {
        "#{provider}": {
          status: type,
          response: value
        }
      }
    end
  end
end
