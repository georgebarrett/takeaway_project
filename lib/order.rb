require 'meal'
require 'menu'

class Order

  def initialize(io = Kernel)
    @order = []
    @io = io
    @total = 0.0
  end

  def add_to_order(meal)
    @order << meal.show_name_and_price
    @total += meal.show_price
    return @order
  end

  def show_basket
    fail 'Your basket is empty.' if @order.empty?
    basket = @order.join(', ').tr(",", "\n")
    return "#{basket}\n Total: £#{@total.round(2)}"
  end

  def checkout
    fail 'Your basket is empty.' if @order.empty? 
  end

end
