
class View


  attr_reader :itemsList, :itemToShow
  attr_accessor :id, :name, :price, :quantity, :brand

  def initialize(itemsList)
    @itemsList = itemsList
    @id = id
    @name = name
    @price = price
    @quantity = quantity
    @brand = brand
  end

  def start
    puts "  🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥"
    puts " 🔥                                🔥"
    puts "🔥             AmazOOP              🔥"
    puts " 🔥                                🔥"
    puts "  🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥"
  end
  

  def landing_menu   
    puts ""
    puts " --------------------------------"
    puts "|   What do you want to do ?     |"
    puts " --------------------------------"
    puts "|              1                 |"
    puts "|  📜  List of all items         |"
    puts " --------------------------------|"
    puts "|              2                 |"
    puts "|  📝  Add an item               |"
    puts " --------------------------------"
    puts "|              4                 |"
    puts "|  👋  EXIT                      |"
    puts " --------------------------------"
    puts ""
    print "  🌀 : "
    params = gets.chomp.to_i 
    return params

  end


  

  def index_all_items
    puts "🔥⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯🔥"
    puts "|                                    |"
    puts "|              All Items             |"
    puts "|                                    |"
    puts "🔥⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯🔥"
    itemsList.each do |item| 
      puts "⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯"
      puts "Id :    #{item.id} "
      puts "Name :  #{item.name}"
      puts "⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯"
      end
    
  end

  def list_menu
    puts "---------------------------------"
    puts "              1"
    puts "   👀 Show an item"
    puts "---------------------------------"
    puts "          Enter"
    puts "   ⬅️ Back"
    puts "---------------------------------"
    params = gets.chomp.to_i 
    return params
  end

  def search_an_item
    puts "---------------------------------"
    puts " Please enter its ID"
    puts "---------------------------------"
    print " 🌀 Id :  "
    id = gets.chomp.to_i

    params = id
      return params
  end
  
  def self.show(itemToShow)
    puts "
    ⎯  Id :       #{itemToShow.id} 
    ⎯  Name :     #{itemToShow.name} 
    ⎯  Price :    #{itemToShow.price} 
    ⎯  Quantity : #{itemToShow.quantity} 
    ⎯  Brand :    #{itemToShow.brand}
    "  
  end

  def show_menu
    puts "---------------------------------"
    puts "              1"
    puts "   🛠 Update this item"
    puts "---------------------------------"
    puts "              2"
    puts "   ⛔️ Destroy this item"
    puts "---------------------------------"
    puts "          Enter"
    puts "   ⬅️ Back"
    puts "---------------------------------"
    print " 🌀 : "
    params = gets.chomp.to_i 
    return params
  end

  def update_an_item(itemToShow)
    puts "You will update : #{itemToShow.name} (id : #{itemToShow.id})"
    puts 'if you do not want to modify a field, please leave it empty, just press "ENTER" to go to the next one'
    @id = itemToShow.id
    puts "   update Name :"
    print "  🌀 "
    @name = gets.chomp
    puts "   update Price :"
    print "  🌀 "
    @price = gets.chomp
    puts "   update Quantity :"
    print "  🌀 "
    @quantity = gets.chomp
    puts "   update Brand :"
    print "  🌀 "
    @brand = gets.chomp
    params = {id:@id, name:@name, price:@price, quantity:@quantity, brand:@brand}
    return params
  end
  
  def destroy_confirmation
    puts "⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️"
    puts "⛔️   Are you sure ?   ⛔️"
    puts "⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️⛔️"
    puts "Press yes or ENTER"
    print " > "
    params = gets.chomp
    return params
  end
  

  def new_item
    @id = itemsList.last.id + 1
    puts "   Name :"
    print "  > "
    @name = gets.chomp
    puts "   Price :"
    print "  > "
    @price = gets.chomp
    puts "   Quantity :"
    print "  > "
    @quantity = gets.chomp
    puts "   Brand :"
    print "  > "
    @brand = gets.chomp
    parameters = {id:@id, name:@name, price:@price, quantity:@quantity, brand:@brand}
    return parameters
  end
  
  def new_item_error
    puts ""
    puts ""
    puts ""
    puts "📛📛📛📛📛📛📛📛📛📛📛📛📛📛📛📛📛📛📛📛📛📛"
    puts "   Name can't be blank"
    puts "   Price can't be blank or negative"
    puts "📛📛📛📛📛📛📛📛📛📛📛📛📛📛📛📛📛📛📛📛📛📛"
    puts ""
    puts ""
    puts "        🤞🤞🤞🤞🤞🤞🤞 "
    puts "      🤞 RETRY PLEASE 🤞"
    puts "        🤞🤞🤞🤞🤞🤞🤞 "
    puts ""
    puts ""
  end

  def new_item_saved
    puts ""
    puts ""
    puts "✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅"
    puts "✅                                    ✅"
    puts "✅     New Item saved with success    ✅"
    puts "✅                                    ✅"
    puts "✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅"
    puts ""
    puts ""
  end

  def see_you_soon
    puts "👋👋👋👋👋👋👋👋👋👋👋👋👋👋👋👋👋👋👋👋"
    puts "👋                                    👋"
    puts "👋            See you soon            👋"
    puts "👋                                    👋"
    puts "👋👋👋👋👋👋👋👋👋👋👋👋👋👋👋👋👋👋👋👋"

  end

  def syntax_error
    puts ""
    puts "🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐"
    puts "🧐                                    🧐"
    puts "🧐        I don't understand          🧐"
    puts "🧐                                    🧐"
    puts "🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐🧐"
    puts ""
  end
  
  
end