class WorkoutpostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy


    def create
        @workoutpost = current_user.workoutposts.build(workoutpost_params)
        if @workoutpost.save
          flash[:success] = "Workout log created!"
          redirect_to root_url
        else
          @feed_items = []
          render 'static_pages/home'
        end
    end
  
    def destroy
        @workoutpost.destroy
        flash[:success] = "Workout log deleted"
        redirect_to request.referrer || root_url
    end

    private

    def workoutpost_params
      params.require(:workoutpost).permit(:content,:mood,:length)
    end

    def correct_user
        @workoutpost = current_user.workoutposts.find_by(id: params[:id])
        redirect_to root_url if @workoutpost.nil?
    end
end
