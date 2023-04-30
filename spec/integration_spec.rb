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

  context "ordering meals" do
    it 'adds 1 item to the basket and displays a total price' do
      meal_1 = Meal.new("Sashimi", 11.99)
      
      menu = Menu.new
      menu.add_menu(meal_1)
      
      order = Order.new
      order.add_to_order(meal_1)
      expect(order.show_basket).to eq "Sashimi - £11.99\n Total: £11.99"
    end

    it "adds multiple items to the basket and returns the total price" do
      meal_1 = Meal.new("Katsu Curry", 9.99)
      meal_2 = Meal.new("Sashimi", 11.99)
      meal_3 = Meal.new("Gyoza", 5.99)
      
      menu = Menu.new
      menu.add_menu(meal_1)
      menu.add_menu(meal_2)
      menu.add_menu(meal_3)
      
      order = Order.new
      order.add_to_order(meal_1)
      order.add_to_order(meal_2)
      order.add_to_order(meal_3)
      expect(order.show_basket).to eq "Katsu Curry - £9.99\n Sashimi - £11.99\n Gyoza - £5.99\n Total: £27.97"
    end
  end

  context "checking Out" do
    it 'fails if basket is empty' do
      order = Order.new
      expect { order.checkout }.to raise_error "Your basket is empty."
    end

    it "lets you exit checkout is user enters N" do
      io = double(:io)
      expect(io).to receive(:puts).with("Here is your final order: ")
      expect(io).to receive(:puts).with("Sashimi - £11.99\n Total: £11.99")
      expect(io).to receive(:puts).with("To order enter Y, to cancel enter N")
      expect(io).to receive(:gets).and_return("N")
      expect(io).to receive(:puts).with("Exiting checkout")
  
      meal_1 = Meal.new("Sashimi", 11.99)
      
      menu = Menu.new
      menu.add_menu(meal_1)

      order = Order.new(io)
      order.add_to_order(meal_1)
      order.checkout
    end

    it "lets you checkout an order with only one item when the user confirms" do
      io = double(:io)
      expect(io).to receive(:puts).with("Here is your final order: ")
      expect(io).to receive(:puts).with("Katsu Curry - £9.99\n Total: £9.99")
      expect(io).to receive(:puts).with("To order enter Y, to cancel enter N")
      expect(io).to receive(:gets).and_return("Y")
      expect(io).to receive(:puts).with("Order confirmed. Your food will be delivered by drone shortly!")
        
      meal_1 = Meal.new("Katsu Curry", 9.99)
      
      menu = Menu.new
      menu.add_menu(meal_1)
      
      order = Order.new(io)
      order.add_to_order(meal_1)
      order.checkout
    end
  end

end