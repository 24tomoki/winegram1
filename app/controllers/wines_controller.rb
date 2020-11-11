class WinesController < ApplicationController
  
  def new
    @wine = Wine.new
  end
  
  def index
    @wines = Wine.all
  end
  
  def show
    @wine = Wine.find(params[:id])
  end
  
  def edit
    @wine = Wine.find(params[:id])
  end
  
  
  def create
    # データ新規登録するインスタンス
   wine = Wine.new(wine_params)
   wine.user_id = current_user.id
   #wine.image_id = wine_params[:image]
    # データを保存する
   wine.save!
    # トップ画面にリダイレクトする
   redirect_to wines_path
  end
  
  
  def update
    @wine = Wine.find(params[:id])
    @wine.update(wine_params)
    redirect_to wines_path
  end
  
  private
  
  def wine_params
    params.require(:wine).permit(:name, :explanation, :image)
  end
  
end
