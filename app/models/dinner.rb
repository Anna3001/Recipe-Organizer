class Dinner < ApplicationRecord
  has_many :recipe_dinners
  has_many :recipes, through: :recipe_dinners

  accepts_nested_attributes_for :recipes
end
