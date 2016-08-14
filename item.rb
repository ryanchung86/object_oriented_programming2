# require_relative "item"

class Item

  # can now return these attributes
  attr_accessor :price
  attr_reader :type
  attr_reader :exemption
  attr_reader :location

  def initialize(type, location, exemption, price)
    @type = type
    @location = location
    @exemption = exemption
    @price = price
  end

# class Receipt

  @@cart = []
  @@new_price = []
  @@list = []
  @@total_list = []
  @@total_tax = []
  @@tax_list = []

  def self.cart
    @@cart.each do |item, import, exempt, cost|
      puts "1 #{item}: #{cost}"
    end
    puts "Sales Taxes: #{@@tax_list.reduce(:+)}"
    puts "Total: #{@@total_list.reduce(:+)}"
  end

  # Create array of instances with all attributes
  def add_tax
    if @location == "imported" && @exemption == "taxed"
      @@new_price = [@type, @location, @exemption, (@price * 1.15).round(2)]
    elsif @location != "imported" && @exemption == "taxed"
      @@new_price = [@type, @location, @exemption, (@price * 1.10).round(2)]
    elsif @location != "imported" && @exemption == "exempt"
      @@new_price = [@type, @location, @exemption, @price.round(2)]
    elsif @location == "imported" && @exemption == "exempt"
      @@new_price = [@type, @location, @exemption, (@price * 1.05).round(2)]
    end
    @@cart = @@cart << @@new_price
  end

  # Create array of instances with just price totals
  def bill
    if @location == "imported" && @exemption == "taxed"
      @@list = (@price * 1.15).round(2)
    elsif @location != "imported" && @exemption == "taxed"
      @@list = (@price * 1.10).round(2)
    elsif @location != "imported" && @exemption == "exempt"
      @@list = @price.round(2)
    elsif @location == "imported" && @exemption == "exempt"
      @@list = (@price * 1.05).round(2)
    end
    @@total_list = @@total_list << @@list
  end

  # Create array of instances with just the sales tax
  def tax
    if @location == "imported" && @exemption == "taxed"
      @@total_tax = (@price * 0.15).round(2)
    elsif @location != "imported" && @exemption == "taxed"
      @@total_tax = (@price * 0.10).round(2)
    elsif @location != "imported" && @exemption == "exempt"
      @@total_tax = (@price * 0).round(2)
    elsif @location == "imported" && @exemption == "exempt"
      @@total_tax = (@price * 0.05).round(2)
    end
    @@tax_list = @@tax_list << @@total_tax
  end

end
  # def tax
  #   if @location == "imported" && @exemption == "taxed"
  #     @price * 1.15
  #   elsif @location != "imported" && @exemption == "taxed"
  #     @price * 1.10
  #   elsif @location != "imported" && @exemption == "exempt"
  #     @price
  #   elsif @location == "imported" && @exemption == "exempt"
  #     @price * 1.05
  #   end
  # end

# end

# Example 1
b1 = Item.new("book", "domestic", "exempt", 12.49)
m1 = Item.new("music CD", "domestic", "taxed", 14.99)
c1 = Item.new("chocolate bar", "domestic", "exempt", 0.85)
b1.add_tax
m1.add_tax
c1.add_tax
b1.bill
m1.bill
c1.bill
b1.tax
m1.tax
c1.tax
Item.cart

# Example 2
c2 = Item.new("imported box of chocolates", "imported", "exempt", 10.00)
p1 = Item.new("imported bottle of perfume", "imported", "taxed", 47.50)
c2.add_tax
p1.add_tax
c2.bill
p1.bill
c2.tax
p1.tax
Item.cart

# Example 3
p2 = Item.new("imported bottle of perfume", "imported", "taxed", 27.99)
p3 = Item.new("bottle of perfume", "domestic", "taxed", 18.99)
h1 = Item.new("packet of headache pills", "domestic", "exempt", 9.75)
c3 = Item.new("box of imported chocolates", "imported", "exempt", 11.25)
p2.add_tax
p3.add_tax
h1.add_tax
c3.add_tax
p2.bill
p3.bill
h1.bill
c3.bill
p2.tax
p3.tax
h1.tax
c3.tax
Item.cart
