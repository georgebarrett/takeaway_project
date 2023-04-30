require 'order'

RSpec.describe Order do

  context 'when ordering' do
    it 'adds a meal and returns the meal name and price' do
      meal_1 = double(:meal, show_name: 'Gyoza', show_price: 5.99, show_name_and_price: 'Gyoza - £5.99', is_a?: true)
      menu = double(:menu, menu: [], add_menu: true)
      menu.add_menu(meal_1)
      
      order = Order.new
      expect(order.add_to_order(meal_1)).to eq ['Gyoza - £5.99']
    end

    it 'adds a meal to the order array and shows it in the basket with its price' do
      meal_1 = double(:meal, show_name: 'Gyoza', show_price: 5.99, show_name_and_price: 'Gyoza - £5.99', is_a?: true)
      menu = double(:menu, menu: [], add_menu: true)
      menu.add_menu(meal_1)
      
      order = Order.new
      order.add_to_order(meal_1)
      expect(order.show_basket).to eq "Gyoza - £5.99\n Total: £5.99"
    end

    it 'adds multiple meals to the basket and displays the meals and their total price' do
      meal_1 = double(:meal, show_name: 'Gyoza', show_price: 5.99, show_name_and_price: 'Gyoza - £5.99', is_a?: true)
      meal_2 = double(:meal, show_name: 'Sashimi', show_price: 11.99, show_name_and_price: 'Sashimi - £11.99', is_a?: true)
      meal_3 = double(:meal, show_name: 'Katsu Curry', show_price: 9.99, show_name_and_price: 'Katsu Curry - £9.99', is_a?: true)
      menu = double(:menu, menu: [], add_menu: true)
      menu.add_menu(meal_1)
      menu.add_menu(meal_2)
      menu.add_menu(meal_3)
      
      order = Order.new
      order.add_to_order(meal_1)
      order.add_to_order(meal_2)
      order.add_to_order(meal_3)
      expect(order.show_basket).to eq "Gyoza - £5.99\n Sashimi - £11.99\n Katsu Curry - £9.99\n Total: £27.97"
    end
  end

end