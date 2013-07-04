class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price, :image
  mount_uploader :image, ImageUploader
end
