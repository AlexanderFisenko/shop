class Item < ActiveRecord::Base
  extend Enumerize
  attr_accessible :description, :name, :price, :image, :remote_image_url, :remove_image, :category_id, :sex, :brand_id
  mount_uploader :image, ImageUploader
  enumerize :sex, :in => [:male, :female, :unisex], default: :unisex

  belongs_to :category
  belongs_to :brand
  # has_many :order_items
  # has_many :orders, through: :order_items
end
