class AddCategoryIdToPlants < ActiveRecord::Migration
  def change
    add_column :plants, :category_id, :integer
  end
end
