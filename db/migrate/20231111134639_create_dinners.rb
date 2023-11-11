class CreateDinners < ActiveRecord::Migration[7.0]
  def change
    create_table :dinners do |t|
      t.string :name
      t.text :recipes

      t.timestamps
    end
  end
end
