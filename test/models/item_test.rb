require "test_helper"

class ItemTest < ActiveSupport::TestCase
  test "each fixture is valid" do
    assert items.all?(&:valid?)
  end

  test "name must be present" do
    item = Item.new
    assert_not item.valid?
    assert item.errors.added?(:name, :blank)
  end

  test "ilvl must be a number and greater than or equal to 0" do
    item = Item.new
    assert_not item.valid?
    assert item.errors.added?(:ilvl, :not_a_number, value: item.ilvl)

    item.ilvl = -1
    assert_not item.valid?
    assert item.errors.added?(:ilvl, :greater_than_or_equal_to, count: 0, value: item.ilvl)

    item.ilvl = 0
    assert_not item.valid?
    assert_not item.errors.added?(:ilvl, :greater_than_or_equal_to, count: 0, value: item.ilvl)

    item.ilvl = 1
    assert_not item.valid?
    assert_not item.errors.added?(:ilvl, :greater_than_or_equal_to, count: 0, value: item.ilvl)
  end

  test "weight must be a number and greater than or equal to 0" do
    item = Item.new
    assert_not item.valid?
    assert item.errors.added?(:weight, :not_a_number, value: item.weight)

    item.weight = -1
    assert_not item.valid?
    assert item.errors.added?(:weight, :greater_than_or_equal_to, count: 0, value: item.weight)

    item.weight = 0
    assert_not item.valid?
    assert_not item.errors.added?(:weight, :greater_than_or_equal_to, count: 0, value: item.weight)

    item.weight = 1
    assert_not item.valid?
    assert_not item.errors.added?(:weight, :greater_than_or_equal_to, count: 0, value: item.weight)
  end
end
