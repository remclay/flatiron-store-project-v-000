class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
  has_many :current_carts, class_name: 'User', foreign_key: 'current_cart_id'

  def total
    total = 0
    self.line_items.each do |i|
      item = Item.find_by(id: i.item_id)
      amount = item.price * i.quantity
      total += amount
    end
    total
  end

  def add_item(item_id)
    @existing_item = self.line_items.find_by(id: item_id)
    if @existing_item
      @existing_item.quantity += 1
      @existing_item
    else
      self.line_items.new(cart_id: self.id, item_id: item_id, quantity: 1)
    end
  end
end
