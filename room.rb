class Room

  attr_reader :name_room, :occupants, :playlist, :capacity, :entrance_fees

  def initialize (input_name_room)
    @name_room = input_name_room
    @occupants = []
    @playlist = []
    @capacity = 0
    @entrance_fees = 0

  end

  def add_song_to_playlist(song_name)
    @playlist << song_name
  end

  def check_in_guest(guest_name)
    if @capacity < 5
      @occupants << guest_name
      @capacity += 1
    end
  end

  def check_out_guest(guest_name)
    @occupants.delete(guest_name)
    @capacity -= 1
  end

end
