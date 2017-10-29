module Postwill
  class Settings
    extend ::Dry::Configurable

    setting :providers do
      setting :twitter, {}
      setting :tumblr, {}
    end
  end
end
