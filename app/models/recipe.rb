class Recipe < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user

  has_many :recipe_dinners
  has_many :dinners, through: :recipe_dinners

  scope :public_recipes, -> { where(public: true) }
end
