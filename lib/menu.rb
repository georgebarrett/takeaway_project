class Menu

  def initialize
    @menu = []
  end

  def add_menu(meal)
    fail 'That meal is not on the menu.' unless meal.is_a?(Meal)
    @menu << meal.show_name_and_price
  end

  def show
    new_menu = @menu.join(', ')
    return "#{new_menu}"
  end

end