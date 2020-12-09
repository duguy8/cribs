class House
  attr_reader :string_price,
              :address,
              :rooms
  def initialize(string_price, address)
    @string_price = string_price
    @address = address
    @rooms = []
  end

  def rooms_sorted_by_category
    @rooms.group_by do |room|
      room.category
    end
  end

  def rooms_sorted_by_area
    sorted = @rooms.sort_by do |room|
      room.length * room.width.to_i
    end
    sorted.reverse
  end

  def price_per_square_foot
    new_price = price.to_f / area.to_f
    new_price.round(2)
  end

  def details
    {"price" => price, "address" => address}
  end

  def area
    total_area = 0
    @rooms.each do |room|
      total_area += room.length * room.width.to_i
    end
    total_area
  end

  def rooms_from_category(category)
    categorized = []
    if category == :bedroom
      @rooms.each do |room|
        categorized << room if room.category == :bedroom
      end
    elsif category == :living_room
      @rooms.each do |room|
        categorized << room if room.category == :living_room
      end
    elsif category == :basement
      @rooms.each do |room|
        categorized << room if room.category == :basement
      end
    end
    categorized
  end

  def above_market_average?
    if price > 500000
      true
    else
      false
    end
  end

  def price
    @string_price.delete! "$"
    @string_price.to_i
  end

  def add_room(room)
    @rooms << room
  end
end
