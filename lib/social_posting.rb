require 'bundler'
require 'pry-byebug'
require 'dry-configurable'
require 'dry-monads'
require 'twitter'
require 'koala'
require 'pinterest-api'
Bundler.require(:default)

require_relative 'social_posting/settings'
require_relative 'social_posting/providers/base'
require_relative 'social_posting/providers/twitter'
require_relative 'social_posting/providers/facebook'
require_relative 'social_posting/providers/pinterest'
require_relative 'social_posting/providers/tumblr'
require_relative 'social_posting/response'
require_relative 'social_posting/client'

module SocialPosting
end
