require File.dirname(__FILE__) + '/../test_helper'

class ComposerTest < Test::Unit::TestCase
  fixtures :composers

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Composer, composers(:first)
  end
end
