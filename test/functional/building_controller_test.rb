require 'test_helper'

class BuildingControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  def list_all_test
	assert @building.count == 3
  end
end
