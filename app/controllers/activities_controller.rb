class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
    2.times {@activity.descriptions.build}
  end

  def create
    @activity = Activity.new(activity_params)

    if @activity.save!
      redirect_to @activity
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update_attributes(activity_params)
      redirect_to @activity
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    if @activity.destroy
      redirect_to activities_path
    end
  end

 
  private

  def activity_params
    params.require(:activity).permit(:title, 
      :descriptions_attributes => [:id, :name])
  end

end
