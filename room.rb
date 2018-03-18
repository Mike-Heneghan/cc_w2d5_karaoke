class Room

  attr_reader :name_room, :occupants, :playlist, :capacity, :entrance_fees, :sum_entrance_fees

  def initialize (input_name_room)
    @name_room = input_name_room
    @occupants = []
    @playlist = []
    @capacity = 0
    @entrance_fee = 5
    @sum_entrance_fees = 0

  end

  def add_song_to_playlist(song_name)
    celebrate = []
    if @playlist.include?(song_name) == false
      @playlist << song_name
    end
    for occupant in @occupants
      if occupant.favourite_song() == song_name.title()
        celebrate << occupant.celebrate_fav_song()
      end
    end

  return celebrate[0]
end

  def check_in_guest(guest_name)
    celebrate = []
    if @capacity < 5
      @occupants << guest_name
      @capacity += 1
      guest_name.pay_entrance_fee(@entrance_fee)
      @sum_entrance_fees += @entrance_fee
    end
    for song in @playlist
      if song.title() == guest_name.favourite_song()
        celebrate << guest_name.celebrate_fav_song()
      end
    end

    return celebrate[0]
  end

  def check_out_guest(guest_name)
    @occupants.delete(guest_name)
    @capacity -= 1
  end

end
