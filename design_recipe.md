# Solo Challenge - Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## 2. Design the Class System

_The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```

```

_Class Structure Design:_

```ruby

@DEFAULT_MENU = {
  katsu_curry: 9.99,
  sashimi: 11.99,
  gyoza: 5.99
}

class Order # main class
  def initialize(io = Kernel)
    @order = []
    @io = io
  end

  def show_basket
    fail "Your basket is empty" if @order.empty?
    return @order.each do |item| 
      puts "#{item}"
    end
  end

  def search_menu(search)
    return @view_menu.search_for_food(search)
  end

  def add_to_order(item)  
    @order << item
    return @order
  end

  def checkout_order
    @io.puts "Here is your final order: "
    @io.puts "#{@order.show_basket}"
    @io.puts "To order enter Y, to exit hit N"
    
    input = @io.gets.chomp
    if input == "N"
      @io.puts "Exiting checkout"
    end
  end
end

class Menu
  def initialize(@menu)
    @menu = {
      katsu_curry: 9.99,
      sashimi: 11.99,
      gyoza: 5.99
    }
  end

  def show
    @menu.each do |item, price| 
      puts "#{item}: £#{price}"
    end
  end

  def search_for_food(food)
    @menu.select { |item| return item if food == item}
  end
end

class Food
  def initialize(food, price)
    @food = food
    @price = price
  end
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# 1 - Show menu
order = Order.new
order.show_menu # => katsu_curry: 9.99, sashimi: 11.99, gyoza: 5.99

# 2 - Show order list 
order = Order.new
order.add_to_order(:Katsu_curry)
order.show_basket # => "katsu_curry: £9.99 - Total: £9.99"

# 3 - Search menu by dish
order = Order.new
order.search_menu(gyoza) # => "gyoza: £5.99"
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# 1 - Show empty order list
order = Order.new
order.show_basket # => fail "Your basket is empty"

# 2 - Show order list 
order = Order.new
order.add_to_order(sashimi)
order.show_basket # => "sashimi: £11.99 - Total: £11.99"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._