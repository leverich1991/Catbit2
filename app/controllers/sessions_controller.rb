class SessionsController < ApplicationController
  def new
  end
  def show
  @catbit = Fitbit.find(params[:id])
  end
  def calories
  @client = current_user.fitbit
  @daily_activity = @client.activities_on_date 'today'
  end
  def steps
  @client = current_user.fitbit
  @daily_activity = @client.activities_on_date 'today'
  end
  def distance
  @client = current_user.fitbit
  @daily_activity = @client.activities_on_date 'today'
  end
  def change_goals
    @client = current_user.fitbit
	@client.create_or_update_daily_goal(@opts)
	render 'goals'
  end
  def points_algorithm
	if @daily_activity['goals']['steps']
	@points = (@daily_activity['goals']['steps'] * 0.1)
	elsif @daily_activity['goals']['distance']
	@points = (@daily_activity['goals']['distance'] * 10)
	else
	@points = (@daily_activity['goals']['caloriesOut'] * 0.1)
	end
  end
  
  def main
  auth_hash = request.env['omniauth.auth']
 
  # Log him in or sign him up
  user = User.find_or_create(auth_hash)
 
  # Create the session
  session[:user_id] = user.id
  
  @client = user.fitbit
  @daily_activity = @client.activities_on_date 'today'
  end
  
  def create
  auth_hash = request.env['omniauth.auth']
 
  # Log him in or sign him up
  user = User.find_or_create(auth_hash)
 
  # Create the session
  session[:user_id] = user.id
  
  @client = user.fitbit
  @daily_activity = @client.activities_on_date 'today'
  render 'main'  
  end
  def current_user
	User.find_by(id: session[:user_id])
  end
  def update
  current_user.update(user_params)
  render 'settings'
  end
  def destroy
    session[:user_id] = nil
    render 'new'
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end

  protected
  def user_params
    params.require(:user).permit(:name, :age, :height, :weight)
	end
end

