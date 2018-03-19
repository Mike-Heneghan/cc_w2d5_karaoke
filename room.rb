class Room

  attr_reader :name_room, :occupants, :playlist, :capacity, :entrance_fees, :sum_entrance_fees

  def initialize (input_name_room, max_cap = 5)
    @name_room = input_name_room
    @occupants = []
    @playlist = []
    @capacity = 0 # number people in the room now
    @max_capacity =  max_cap # number people in the room now
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
    if @capacity < @max_capacity
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


# Remember capacity variable could be replaced by occupants.length
# update the uml diagram with return then the purpose of the method.
# add bar tab and check in group function.
# look into the runner file
