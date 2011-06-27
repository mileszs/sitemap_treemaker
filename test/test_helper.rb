require 'minitest/autorun'
require 'fakeweb'
require 'rr'

begin; require 'turn'; rescue LoadError; end

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

class MiniTest::Unit::TestCase
   include RR::Adapters::TestUnit
end
