require 'bundler'
require 'pry-byebug'
require 'dry-configurable'
require 'dry-monads'
require 'twitter'
require 'koala'
require 'pinterest-api'
require 'instagram_upload'

Bundler.require(:default)

require_relative 'postwill/settings'
require_relative 'postwill/providers/base'
require_relative 'postwill/providers/twitter'
require_relative 'postwill/providers/facebook'
require_relative 'postwill/providers/pinterest'
require_relative 'postwill/providers/tumblr'
require_relative 'postwill/providers/instagram'
require_relative 'postwill/response'
require_relative 'postwill/client'

module Postwill
end
