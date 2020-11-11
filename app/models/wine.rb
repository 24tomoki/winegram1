class Wine < ApplicationRecord
    attachment :image
    belongs_to :user
end