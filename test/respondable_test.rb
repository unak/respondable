require "test_helper"
require "stringio"

class RespondableTest < Test::Unit::TestCase
  def test_that_it_has_a_version_number
    refute_nil ::Respondable::VERSION
  end

  def test_respondable
    {STDOUT => :write, "foo" => :<<, StringIO.new => :write, Object.new => :oops}.each do |obj, expect|
      r = case Respondable(obj)
          when :write
            :write
          when :<<
            :<<
          else
            :oops
          end
       assert_equal(expect, r, "#{obj} is expected to respond to #{expect}, but #{r}")
    end
  end
end
