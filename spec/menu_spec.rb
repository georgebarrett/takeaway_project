require 'menu'

RSpec.describe Menu do

  it "fail if user adds something that is not a Menu object" do
    menu = Menu.new
    expect { menu.add_menu("test") }.to raise_error "That meal is not on the menu."
  end

  it 'adds a new dish including the price' do
    meal_1 = double(:meal, show_name_and_price: 'Gyoza - £5.99', is_a?: true)

    menu = Menu.new
    menu.add_menu(meal_1)
    expect(menu.show).to eq 'Gyoza - £5.99'
  end

end