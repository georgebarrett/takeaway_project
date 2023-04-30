class Menu

  def initialise
    @menu = []
  end

  def add_menu(meal)
    fail 'That meal is not on the menu.' unless meal.is_a?(Meal)
  end

end