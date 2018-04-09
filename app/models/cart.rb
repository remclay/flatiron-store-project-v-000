class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :current_cart, class_name: 'User', foreign_key: 'current_cart_id'
end
