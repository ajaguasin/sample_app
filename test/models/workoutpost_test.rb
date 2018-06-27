require 'test_helper'

class WorkoutpostsTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @workoutpost = @user.workoutposts.build(content: "Lorem ipsum", mood: "Happy", length: "Half an hour")
  end

  test "should be valid" do
    assert @workoutpost.valid?
  end

  test "user id should be present" do
    @workoutpost.user_id = nil
    assert_not @workoutpost.valid?
  end

  test "content should be present" do
    @workoutpost.content = "   "
    assert_not @workoutpost.valid?
  end

  test "content should be at most 140 characters" do
    @workoutpost.content = "a" * 141
    assert_not @workoutpost.valid?
  end

  test "mood should be present" do
    @workoutpost.mood = "   "
    assert_not @workoutpost.valid?
  end

  test "length should be present" do
    @workoutpost.length = "   "
    assert_not @workoutpost.valid?
  end

  test "order should be most recent first" do
    assert_equal workoutposts(:most_recent), Workoutpost.first
  end

end