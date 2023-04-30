require 'menu'

class Meal

  def initialize(meal_name, meal_price)
    fail 'Dish name must be a string.' unless meal_name.is_a?(String)
    @meal_name = meal_name
    @meal_price = meal_price
  end

  def show_name
    @meal_name
  end

  def show_price
    @meal_price
  end

  def show_name_and_price
    return "#{@meal_name} - £#{@meal_price}"
  end

end