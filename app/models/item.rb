class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price, :image, :remote_image_url, :remove_image, :category_id, :sex, :brand_id
  mount_uploader :image, ImageUploader

  belongs_to :category
  belongs_to :brand
  # has_many :order_items
  # has_many :orders, through: :order_items
end
