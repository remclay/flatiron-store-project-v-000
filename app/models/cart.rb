class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
  has_many :current_carts, class_name: 'User', foreign_key: 'user_id'
end
