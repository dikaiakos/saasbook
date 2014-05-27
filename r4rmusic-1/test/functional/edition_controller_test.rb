require File.dirname(__FILE__) + '/../test_helper'
require 'edition_controller'

# Re-raise errors caught by the controller.
class EditionController; def rescue_action(e) raise e end; end

class EditionControllerTest < Test::Unit::TestCase
  def setup
    @controller = EditionController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
