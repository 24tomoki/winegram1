class Wine < ApplicationRecord
    attachment :image
    belongs_to :user 
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    
    enum genre: {
        red: 0,
        white: 1,
        sparkling: 2
    }
end