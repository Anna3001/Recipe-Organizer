class Dinner < ApplicationRecord
  has_many :recipe_dinners
  has_many :recipes, through: :recipe_dinners
end
