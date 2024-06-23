class WorkoutsController < ApplicationController
  before_action :authenticate_user!

  def index
    @workouts = current_user.workouts
    @workout = Workout.new
  end

  def create
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      redirect_to workouts_path, notice: 'Workout logged successfully.'
    else
      render :index
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:sport, :duration, :calories_burned)
  end
end
