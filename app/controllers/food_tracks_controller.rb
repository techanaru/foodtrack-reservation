class FoodTracksController < ApplicationController
  def index
    @food_track = FoodTrack.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @food_track = FoodTrack.find(params[:id])
  end

  def new
    @food_track = FoodTrack.new
  end

  def create
    @food_track = FoodTrack.new(food_track_params)
    
    if @food_track.save
      flash[:success] = 'トラックを登録しました。'
      redirect_to @food_track
    else
      flash.now[:danger] = 'トラックの登録に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  #Strong Paramater
  def food_track_params
    params.require(:food_track).permit(:name, :image)
  end
  
end
