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

    it 'fails if no meals are added to order and show_basket is called' do
      order = Order.new
      expect { order.show_basket }.to raise_error "Your basket is empty."
    end
  end

  context 'when checking out' do
    it 'fails if basket is empty' do
      order = Order.new
      expect { order.checkout }.to raise_error 'Your basket is empty.'
    end

    it 'lets user checkout if they enter N' do
      io = double(:io)
      expect(io).to receive(:puts).with("Here is your final order: ")
      expect(io).to receive(:puts).with("Gyoza - £6.99\n Total: £6.99")
      expect(io).to receive(:puts).with("To order enter Y, to cancel enter N")
      expect(io).to receive(:gets).and_return("N")
      expect(io).to receive(:puts).with("Exiting checkout")

      meal_1 = double(:dishes, show_name: "Gyoza", show_price: 6.99, show_name_and_price: "Gyoza - £6.99", is_a?: true)
      menu = double(:menu, menu: [], add_menu: true)
      menu.add_menu(meal_1)
      
      order = Order.new(io)
      order.add_to_order(meal_1)
      order.checkout
    end

    it "lets you checkout an order with one item when user confirms" do
      io = double(:io)
      expect(io).to receive(:puts).with("Here is your final order: ")
      expect(io).to receive(:puts).with("Gyoza - £6.99\n Total: £6.99")
      expect(io).to receive(:puts).with("To order enter Y, to cancel enter N")
      expect(io).to receive(:gets).and_return("Y")
      expect(io).to receive(:puts).with("Order confirmed. Your food will be delivered by drone shortly!")
      
      meal_1 = double(:dishes, show_name: "Gyoza", show_price: 6.99, show_name_and_price: "Gyoza - £6.99", is_a?: true)
      menu = double(:menu, menu: [], add_menu: true)
      menu.add_menu(meal_1)
      
      order = Order.new(io)
      order.add_to_order(meal_1)
      order.checkout
    end
  end

end