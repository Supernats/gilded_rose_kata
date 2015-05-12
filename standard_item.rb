class StandardItem
  attr_reader :name
  attr_accessor :sell_in
  attr_accessor :quality

  def initialize(name, sell_in, quality)
    @name, @sell_in, @quality = name, sell_in, quality
  end

  def register_passage_of_time!
    update_quality! if can_update_quality?
    update_sell_in!
  end

  def self.max_quality
    50
  end

  def self.min_quality
    0
  end

  private

  def can_update_quality?
    !at_or_above_max_quality? && !at_or_below_min_quality?
  end

  def update_quality!
    register_incremental_quality_change!
    correct_out_of_bounds_quality!
  end

  def register_incremental_quality_change!
    self.quality -= quality_change
  end

  def correct_out_of_bounds_quality!
    self.quality = StandardItem.min_quality if at_or_below_min_quality?
    self.quality = StandardItem.max_quality if at_or_above_max_quality?
  end

  def update_sell_in!
    self.sell_in -= 1
  end

  def at_or_above_max_quality?
    quality >= StandardItem.max_quality
  end

  def at_or_below_min_quality?
    quality <= StandardItem.min_quality
  end

  def quality_change
    sell_in <= 0 ? 2 : 1
  end
end
