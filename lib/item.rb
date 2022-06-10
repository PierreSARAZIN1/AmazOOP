require 'csv'
require_relative 'model'

class Item < Model

  attr_accessor :id, :name, :price, :quantity, :brand

  def initialize (id, name, price, quantity, brand)
    @id = id
    @name = name
    @price = price
    @quantity = quantity
    @brand = brand
  end

  def self.index
    @items = Item.all #== data /model.rb
  end

  def self.show(params)
    @items.each do |item|
      if item.id == params
        @item = item
      end
    end 
    return @item #<Item:sdvcsdv>
  end

  def save
    devise = "$"
    array = ["#{@id.to_i}""\t""#{@name}""\t""#{devise}""#{@price}""\t""#{@quantity}""\t""#{@brand}"]
 
    CSV.open("db/inventaire.csv", "a+") do |csv|
        csv << array
    end
    @items = Item.all
    @newItem = @items.last
    return  @newItem
  end

  def self.update(params)
    @items.each do |item|
      if item.id == params.values[0]
        @item = item
      end
    end
      if params.values[1] != "" 
        @item.name = params.values[1]
      elsif params.values[2] != "" 
        @item.price = "$#{params.values[2]}"
      elsif params.values[3] != "" 
        @item.quantity = params.values[3]
      elsif params.values[4] != "" 
        @item.brand = params.values[4]
      end
  
      CSV.open('db/inventaire.csv', 'w') do |csv|
      end
      File.open("db/inventaire.csv", 'a+') { |f| f.write("id\tName\tprice\tquantity\tbrand\n")}
      @items.each do |item|
        File.open("db/inventaire.csv", 'a+') { |f| f.write("#{item.id}\t#{item.name}\t#{item.price}\t#{item.quantity}\t#{item.brand}\n")}
      end
  end
  
  def self.destroy
    @items.delete(@item)
    CSV.open('db/inventaire.csv', 'w') do |csv|
    end
    File.open("db/inventaire.csv", 'a+') { |f| f.write("id\tName\tprice\tquantity\tbrand\n")}
    @items.each do |item|
      File.open("db/inventaire.csv", 'a+') { |f| f.write("#{item.id}\t#{item.name}\t#{item.price}\t#{item.quantity}\t#{item.brand}\n")}
    end
  end
end