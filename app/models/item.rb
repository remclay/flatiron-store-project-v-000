class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  has_many :carts, through: :line_items

  def self.with_inventory
    Item.where("inventory > ?", 0)
  end
end
