require 'test_helper'

class WorkoutpostsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "workoutpost interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Workoutpost.count' do
      post workoutposts_path, params: { workoutpost: { content: "" } }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    content = "This workoutpost really ties the room together"
    mood = "Happy"
    length = "1 minute"
    assert_difference 'Workoutpost.count', 1 do
      post workoutposts_path, params: { workoutpost: { content: content , mood: mood, length: length} }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # Delete post
    assert_select 'a', text: 'delete'
    first_workoutpost = @user.workoutposts.paginate(page: 1).first
    assert_difference 'Workoutpost.count', -1 do
      delete workoutpost_path(first_workoutpost)
    end
    # Visit different user (no delete links)
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end
end
