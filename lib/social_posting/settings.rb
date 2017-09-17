module SocialPosting
  class Settings
    extend ::Dry::Configurable

    setting :providers do
      setting :twitter, {}
      setting :facebook, {}
    end
  end
end
