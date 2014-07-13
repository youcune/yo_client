$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'yo_client'

if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!
end
