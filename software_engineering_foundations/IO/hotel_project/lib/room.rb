class Room
  attr_reader :capacity, :occupants

  def initialize(capacity)
    @capacity = capacity
    @occupants = []
  end

  def full?
    @occupants.length >= @capacity
  end

  def available_space
    @capacity - @occupants.length
  end

  def add_occupant(occupant_name)
    if full?
      false
    else
      @occupants << occupant_name
      true
    end
  end
end
