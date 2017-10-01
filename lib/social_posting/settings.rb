module SocialPosting
  class Settings
    extend ::Dry::Configurable

    setting :providers do
      setting :twitter, {}
    end
  end
end
