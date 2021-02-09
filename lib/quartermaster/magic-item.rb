class MagicItem

    attr_accessor :name, :index, :equip_category, :desc 

    @@all = []

    def initialize(name = nil, index = nil, equip_category = nil, desc = nil)
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

    def self.clear
        @@all.clear
    end

end