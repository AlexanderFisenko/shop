class Order < ActiveRecord::Base
  attr_accessible :user_name, :user_email, :token, :item_ids

  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  before_create :generate_token
  validates :user_email, presence: true



  def generate_token
    self.token = SecureRandom.hex
  end

  def to_param
    token
  end


end
