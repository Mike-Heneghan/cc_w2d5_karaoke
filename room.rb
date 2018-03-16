class Room

  attr_reader :name_room, :occupants, :playlist

  def initialize (input_name_room)
    @name_room = input_name_room
    @occupants = []
    @playlist = []

  end


end
