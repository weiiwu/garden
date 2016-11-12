class AddPlantIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :plant_id, :integer
  end
end
