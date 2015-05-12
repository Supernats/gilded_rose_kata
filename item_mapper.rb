class ItemMapper
  class << self
    def from_structs(items)
      items.map { |item| klass_for(item).new(item.name, item.sell_in, item.quality) }
    end

    private
    def klass_for(item)
      Module.const_get(klass_hash[item.name] || 'StandardItem')
    end

    def klass_hash
      {
        'Aged Brie' => 'Cheese',
        'Backstage passes to a TAFKAL80ETC concert' => 'Ticket',
        'Sulfuras, Hand of Ragnaros' => 'Sulfuras',
        'Conjured Mana Cake' => 'ConjuredItem'
      }
    end
  end
end
