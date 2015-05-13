require 'cheese'
require 'conjured_item'
require 'item_mapper'
require 'standard_item'
require 'sulfuras'
require 'ticket'

def update_quality(items)
  objectified = ItemMapper.from_structs(items)
  objectified.each &:register_passage_of_time!

  items.each_with_index do |item, index|
    source = objectified[index]

          

    item.sell_in = source.sell_in
    item.quality = source.quality
  end
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]
