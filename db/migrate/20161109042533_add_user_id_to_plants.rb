class AddUserIdToPlants < ActiveRecord::Migration
  def change
    add_column :plants, :user_id, :integer
  end
end
