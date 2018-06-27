class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @workoutpost  = current_user.workoutposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def exercises
  end

  
end
