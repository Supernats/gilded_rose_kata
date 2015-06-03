require 'standard_item'

class Ticket < StandardItem
  private

  def register_incremental_quality_change!
    if sell_in <= 0
      self.quality = 0
    else
      self.quality += quality_change
    end
  end

  def quality_change
    case sell_in
    when (11...Float::INFINITY) then 1
    when (6...11) then 2
    when (0...6) then 3
    end
  end
end
