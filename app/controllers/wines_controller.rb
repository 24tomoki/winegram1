class WinesController < ApplicationController
  
  def new
    @wine = Wine.new
  end
  
  def index
    #@wines = Wine.page(params[:page]).per(5)
    if params[:genre] == nil
    @wines = Wine.all
    end
    if params[:genre] == "red"
      @wines = Wine.where(genre: "red")
    elsif params[:genre] == "white"
      @wines = Wine.where(genre: "white")
    elsif params[:genre] == "sparkling"
      @wines = Wine.where(genre: "sparkling")
    end 
  end
  
  def show
    @wines = Wine.all
    @wine = Wine.find(params[:id])
  end
  
  def edit
    @wine = Wine.find(params[:id])
  end
  
  def destroy
    wine = Wine.find(params[:id])  # データ（レコード）を1件取得
    wine.destroy  # データ（レコード）を削除
    redirect_to wines_path
  end
  
  
  def create
    # データ新規登録するインスタンス
   wine = Wine.new(wine_params)
   wine.user_id = current_user.id
   #wine.image_id = wine_params[:image]
    # データを保存する
   if wine.save
    # トップ画面にリダイレクトする
    redirect_to wines_path
   else 
     @wine = Wine.new
     render 'new'
   end
   
  end
  
  
  def update
    wine = Wine.find(params[:id])
    wine.update(wine_params)
    redirect_to user_path(current_user)
  end
  
  private
  
  def wine_params
    params.require(:wine).permit(:name, :description, :image, :genre)
  end
  
end
