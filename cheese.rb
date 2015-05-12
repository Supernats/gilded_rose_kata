require 'standard_item'

class Cheese < StandardItem
  private

  def quality_change
    -super
  end
end
