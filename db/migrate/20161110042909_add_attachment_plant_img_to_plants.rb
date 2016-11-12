class AddAttachmentPlantImgToPlants < ActiveRecord::Migration
  def self.up
    change_table :plants do |t|
      t.attachment :plant_img
    end
  end

  def self.down
    remove_attachment :plants, :plant_img
  end
end
