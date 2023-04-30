require 'meal'

RSpec.describe Meal do

  it 'fails if not given a string for the meal name' do
    expect { meal = Meal.new(:gyoza, 5.99) }.to raise_error 'Dish name must be a string.'
  end

end