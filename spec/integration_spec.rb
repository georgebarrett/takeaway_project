require 'meal'
require 'menu'
require 'order'

RSpec.describe 'integration' do

  context 'adding meal to the menu instance array' do
    it 'will fail to add a meal if it is not a Meal object' do
      menu = Menu.new
      non_existant_meal = 'test'
      expect { menu.add_menu(non_existant_meal) }.to raise_error 'That meal is not on the menu.'
    end

    it "adds a new meal to the menu instance array, with price" do
      meal_1 = Meal.new("Gyoza", 5.99)
      
      menu = Menu.new
      menu.add_menu(meal_1)
      expect(menu.show).to eq "Gyoza - £5.99"
    end

    it "adds multiple meals to the menu instance array, with their prices" do
      meal_1 = Meal.new("Gyoza", 5.99)
      meal_2 = Meal.new("Katsu Curry", 9.99)
      meal_3 = Meal.new("Sashimi", 11.99)
      
      menu = Menu.new
      menu.add_menu(meal_1)
      menu.add_menu(meal_2)
      menu.add_menu(meal_3)
      expect(menu.show).to eq "Gyoza - £5.99\n Katsu Curry - £9.99\n Sashimi - £11.99"
    end
  end

end