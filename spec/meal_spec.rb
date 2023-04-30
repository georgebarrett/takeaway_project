require 'meal'

RSpec.describe Meal do

  it 'fails if not given a string for the meal name' do
    expect { meal = Meal.new(:gyoza, 5.99) }.to raise_error 'Dish name must be a string.'
  end

  it 'shows the full meal data' do
    meal = Meal.new('Gyoza', 5.99)
    expect(meal.show_name_and_price).to eq 'Gyoza - £5.99'
  end

  it 'creates a meal' do
    meal = Meal.new('Sashimi', 11.99)
    expect(meal.show_name).to eq 'Sashimi'
    expect(meal.show_price).to eq 11.99
  end

end