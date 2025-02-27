require "test_helper"

class GuildCharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guild_character = guild_characters(:one)
  end

  test "should get index" do
    get guild_characters_url
    assert_response :success
  end

  test "should get new" do
    get new_guild_character_url
    assert_response :success
  end

  test "should create guild_character" do
    assert_difference("GuildCharacter.count") do
      post guild_characters_url, params: { guild_character: { character_id: @guild_character.character_id, guild_id: @guild_character.guild_id, role: @guild_character.role } }
    end

    assert_redirected_to guild_character_url(GuildCharacter.last)
  end

  test "should show guild_character" do
    get guild_character_url(@guild_character)
    assert_response :success
  end

  test "should get edit" do
    get edit_guild_character_url(@guild_character)
    assert_response :success
  end

  test "should update guild_character" do
    patch guild_character_url(@guild_character), params: { guild_character: { character_id: @guild_character.character_id, guild_id: @guild_character.guild_id, role: @guild_character.role } }
    assert_redirected_to guild_character_url(@guild_character)
  end

  test "should destroy guild_character" do
    assert_difference("GuildCharacter.count", -1) do
      delete guild_character_url(@guild_character)
    end

    assert_redirected_to guild_characters_url
  end
end
