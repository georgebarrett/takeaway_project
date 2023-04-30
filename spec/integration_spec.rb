require 'meal'
require 'menu'
require 'order'

RSpec.describe 'integration' do

  context 'creating and adding to menu' do
    it 'will fail to add a meal if it is not a Meal object' do
      menu = Menu.new
      non_existant_meal = 'test'
      expect { menu.add_menu(non_existant_meal) }.to raise_error 'That meal is not on the menu.'
    end
  end

end