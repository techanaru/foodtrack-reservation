class FoodMenusController < ApplicationController
  
  def index
    @food_menu = FoodMenu.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @food_menu = FoodMenu.find(params[:id])
  end

  def new
    @food_menu = FoodMenu.new
  end

  def create
    @food_menu = FoodMenu.new(food_menu_params)
    if @food_menu.save
      flash[:success] = 'メニューを登録しました。'
      redirect_to @food_menu
    else
      flash.now[:danger] = 'メニューの登録に失敗しました。'
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
  def food_menu_params
    params.require(:food_menu).permit(:name, :image, :sales_quantity, :price, :food_track_id)
  end
  
end
