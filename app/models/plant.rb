class Plant < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :reviews

  has_attached_file :plant_img, styles: { plant_index: "250x350>", plant_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :plant_img, content_type: /\Aimage\/.*\z/
end
