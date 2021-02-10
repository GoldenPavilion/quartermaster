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

    def self.random
        Quartermaster::API.get_items
        randomizer = MagicItem.all.sample
        Quartermaster::API.item_details(randomizer)

        puts "Name: #{randomizer.name}".colorize(:light_yellow)
        puts "Type: #{randomizer.desc[0]}"
        puts "Desc: #{randomizer.desc[1..20].join(",")}"
    end

end