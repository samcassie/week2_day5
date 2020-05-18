class Karaoke

    attr_accessor :name, :rooms,

    def initialize(name)
        @name = name
        @rooms = []
    end

    def add_rooms(room)
        @rooms.push(room)
    end

end
