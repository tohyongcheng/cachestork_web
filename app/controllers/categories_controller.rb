class CategoriesController < ApplicationController

  def show

  end

  def create
    SearchYoutubeJob.new.async.perform(category_params[:title], 20)
    flash[:notice] = "We are currently creating a new playlist based on the category you have!"
    redirect_to root_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
