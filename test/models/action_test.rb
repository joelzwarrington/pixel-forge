require "test_helper"

class ActionTest < ActiveSupport::TestCase
  test "each fixture is valid" do
    assert actions.all?(&:valid?)
  end
end
