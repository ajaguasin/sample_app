require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Exercise Guideline"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | Exercise Guideline"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | Exercise Guideline"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | Exercise Guideline"
  end

  test "should get exercises" do
    get exercises_path
    assert_response :success
    assert_select "title", "Exercises | Exercise Guideline"

  end

end
