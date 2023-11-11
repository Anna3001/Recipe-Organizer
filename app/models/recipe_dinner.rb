class RecipeDinner < ApplicationRecord
  belongs_to :recipe
  belongs_to :dinner
end
