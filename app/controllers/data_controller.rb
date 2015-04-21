class DataController < ApplicationController
  def show
    @datum = Datum.where(user_id: current_user).first
  end
  
  def create(data_hash)
    @user = User.find_by(id: session[:user_id])
    @data = @user.datas.create(data_hash)
  end

end
