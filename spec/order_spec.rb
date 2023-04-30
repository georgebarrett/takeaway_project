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
  end

end