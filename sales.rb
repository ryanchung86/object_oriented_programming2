class Item

def initialize(type, location, exemption, price)
  @type = type
  @location = location
  @exemption = exemption
  @price = price
end

# @@price_total
# @@total_tax

def tax
  if @location == "imported" && @exemption == "taxed"
    @price * 1.15
  elsif @location != "imported" && @exemption == "taxed"
    @price * 1.10
  elsif @location != "imported" && @exemption == "exempt"
    @price
  elsif @location == "imported" && @exemption == "exempt"
    @price * 1.05
  end
end

def total
  puts receipt
end

end

b1 = Item.new("book", "domestic", "exempt", 12.49)
m1 = Item.new("music CD", "domestic", "taxed", 14.99)
c1 = Item.new("chocolate bar", "domestic", "exempt", 0.85)




# class ExemptItems < Item
# def exempt
#   puts "no tax on me"
# end
# end
#
