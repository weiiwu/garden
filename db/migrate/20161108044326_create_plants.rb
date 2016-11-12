class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.text :description
      t.string :owner

      t.timestamps null: false
    end
  end
end
