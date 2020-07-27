require_relative "room"

class Hotel
  attr_reader :rooms

  def initialize(name, room_capacities)
    @name = name
    @rooms = room_capacities.transform_values { |capacity| Room.new capacity }
  end

  def name
    words = @name.split ' '
    words.map!(&:capitalize)
    words.join ' '
  end

  def room_exists?(room_name)
    !@rooms[room_name].nil?
  end

  def check_in(guest_name, room_name)
    if room_exists? room_name
      if @rooms[room_name].add_occupant guest_name
        puts 'check in successful'
      else
        puts 'sorry, room is full'
      end
    else
      puts 'sorry, room does not exist'
    end
  end

  def has_vacancy?
    @rooms.any? { |_, room| !room.full? }
  end

  def list_rooms
    @rooms.each do |name, room|
      puts name + ' ' + room.available_space.to_s
    end
  end
end
