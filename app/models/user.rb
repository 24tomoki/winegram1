class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :wines, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_wines, through: :likes, source: :wine
  def already_liked?(wine)
    self.likes.exists?(wine_id: wine.id)
  end
end
