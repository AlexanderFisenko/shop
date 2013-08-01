class Category < ActiveRecord::Base
  attr_accessible :name, :parent_id
  belongs_to :parent, :class_name => "Category"
  has_many :categories, foreign_key: :parent_id
  has_many :items
end
