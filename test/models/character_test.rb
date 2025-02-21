require "test_helper"

class CharacterTest < ActiveSupport::TestCase
  test "each fixture is valid" do
    assert characters.all?(&:valid?)
  end

  test "name must be present" do
    character = Character.new
    assert_not character.valid?
    assert character.errors.added?(:name, :blank)
  end

  test "name must be atleast 4 characters long" do
    character = Character.new(name: "aa")
    assert_not character.valid?
    assert character.errors.added?(:name, :too_short, count: 4)

    character.name = "aaaa"
    character.validate
    assert_not character.errors.added?(:name, :too_short, count: 4)
  end

  test "name must be less than 20 characters long" do
    character = Character.new(name: "aaaaaaaaaaaaaaaaaaaaa")
    assert_not character.valid?
    assert character.errors.added?(:name, :too_long, count: 20)

    character.name = "aaaaaaaaaaaaaaaaaaaa"
    character.validate
    assert_not character.errors.added?(:name, :too_long, count: 20)
  end

  test "name must only contain letters and numbers" do
    character = Character.new(name: "aaaa$")
    assert_not character.valid?
    assert character.errors.added?(:name, :invalid, value: character.name)

    character.name = "aaaa1"
    character.validate
    assert_not character.errors.added?(:name, :invalid, value: character.name)
  end

  test "name must be unique" do
    character = Character.new(name: characters(:joel).name)
    assert_not character.valid?
    assert character.errors.added?(:name, :taken, value: character.name)
  end
end
