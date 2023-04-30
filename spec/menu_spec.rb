require 'menu'

RSpec.describe Menu do

  it "fail if user adds something that is not a Menu object" do
    menu = Menu.new
    expect { menu.add_menu("test") }.to raise_error "That meal is not on the menu."
  end

end