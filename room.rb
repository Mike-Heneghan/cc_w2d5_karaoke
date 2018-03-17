class Room

  attr_reader :name_room, :occupants, :playlist

  def initialize (input_name_room)
    @name_room = input_name_room
    @occupants = []
    @playlist = []

  end

  def add_song_to_playlist(song_name)
    @playlist << song_name
  end

  def check_in_guest(guest_name)
    @occupants << guest_name
  end

  def check_out_guest(guest_name)
    @occupants.delete(guest_name)
  end

end
