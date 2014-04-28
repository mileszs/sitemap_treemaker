require 'minitest/autorun'
require 'fakeweb'
require 'rr'

begin; require 'turn'; rescue LoadError; end

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
