require 'pry'

class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
  has_many :current_carts, class_name: 'User', foreign_key: 'current_cart_id'

  def total
    total = 0
    self.items.each {|i| total += i.price }
    total
  end

  def add_item(item_id)
    # @line_item = self.line_items.find(item_id)
    # if @line_item
    #   @line_item.quantity += 1
    # # if self.line_items.ids.include?(item_id)
    # else
      self.line_items.new(cart_id: self.id, item_id: item_id)
      #line_item has an id, quanity, cart_id and item_id
    # end
  end
end
