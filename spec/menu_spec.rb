require 'menu'

RSpec.describe Menu do

  it "fail if user adds something that is not a Menu object" do
    menu = Menu.new
    expect { menu.add_menu("test") }.to raise_error "That meal is not on the menu."
  end

  it 'adds a new meal including the price' do
    meal_1 = double(:meal, show_name_and_price: 'Gyoza - £5.99', is_a?: true)

    menu = Menu.new
    menu.add_menu(meal_1)
    expect(menu.show).to eq 'Gyoza - £5.99'
  end

  it 'adds multiple meals including the prices' do
    meal_1 = double(:meal, show_name_and_price: 'Gyoza - £5.99', is_a?: true)
    meal_2 = double(:meal, show_name_and_price: 'Sashimi - £11.99', is_a?: true)
    meal_3 = double(:meal, show_name_and_price: 'Katsu Curry - £9.99', is_a?: true)

    menu = Menu.new
    menu.add_menu(meal_1)
    menu.add_menu(meal_2)
    menu.add_menu(meal_3)
    expect(menu.show).to eq 'Gyoza - £5.99, Sashimi - £11.99, Katsu Curry - £9.99'
  end

end