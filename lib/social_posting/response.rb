module SocialPosting
  class Response
    def self.call(type, value)
      {
        status: type,
        response: value
      }
    end
  end
end
