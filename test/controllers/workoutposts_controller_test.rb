require 'test_helper'

class WorkoutpostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @workoutpost = workoutposts(:body)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Workoutpost.count' do
      post workoutposts_path, params: { workoutpost: { content: "Lorem ipsum" ,  mood: "Happy", length: "1 hour"} }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Workoutpost.count' do
      delete workoutpost_path(@workoutpost)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong workoutpost" do
    log_in_as(users(:michael))
    workoutpost = workoutposts(:ants)
    assert_no_difference 'Workoutpost.count' do
      delete workoutpost_path(workoutpost)
    end
    assert_redirected_to root_url
  end
end
