class CreateRecipeDinners < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_dinners do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :dinner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
