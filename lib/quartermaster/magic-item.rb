class MagicItem

    attr_accessor :name, :index, :equip_category, :desc 

    @@all = []

    def initialize(name, index, equip_category, desc)
        @name = name 
        @index = index
        @equip_category = equip_category
        @desc = desc
        save
    end 

    def save 
        @@all << self
    end 

    def self.all
        @@all
    end

end