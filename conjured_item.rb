require 'standard_item'

class ConjuredItem < StandardItem
  private

  def quality_change
    super * 2
  end
end
