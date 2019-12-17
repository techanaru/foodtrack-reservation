class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :create]
  
  def index
  end

  def show
    @user = User.find(params[:id])
    @reservations = @user.food_menu_reservations.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザーを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  def favorites
    @user = User.find(params[:id])
    @favorites = @user.food_track_favorites.page(params[:page])
  end
  

  private
  
  #Strong Paramater
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
