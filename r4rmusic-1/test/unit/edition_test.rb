require File.dirname(__FILE__) + '/../test_helper'

class EditionTest < Test::Unit::TestCase
  fixtures :editions

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Edition, editions(:first)
  end
end
