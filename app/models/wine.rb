class Wine < ApplicationRecord
    attachment :image
    belongs_to :user
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    
    enum genres: {
        red: 0,
        white: 1,
        sparkling: 2
    }
end