class Quartermaster::CLI

    def call
        Quartermaster::API.get_items
        greeting
        names = []

        MagicItem.all.each do |item|
            names << item.name
        end

        names.select do |name|
            if name.start_with?("B")
                puts "#{name}"
            end
        end
    end

    def greeting
        puts "Greetings morningrider.".colorize(:light_blue)
        puts "I am Severn Desh, quartermaster of all things arcane.".colorize(:light_blue)
        puts "Would you like to browse a bit or receive a random gift? (browse/random)".colorize(:light_blue)
    end

    def display_items
        puts "Let's see what we have here..."
        puts " "
        Quartermaster::API.get_items
        MagicItem.all.each.with_index(1) do |magic_item, index|
            puts "#{index}. #{magic_item.name}"
        end
        puts " "
        puts "Which item would you like to review? (Choose Number)".colorize(:light_blue)
    end

    def display_magic_item(input = nil)
        puts "An interesting choice...".colorize(:light_blue)

        if input.to_i.between?(1, MagicItem.all.length)
            magic_item = MagicItem.all[input - 1]
            Quartermaster::API.item_details(magic_item)
            
            puts "Name: #{magic_item.name}".colorize(:light_yellow)
            puts "Type: #{magic_item.desc[0]}".colorize(:light_green)
            puts "Desc:"

            magic_item.desc[1..100].each do |l|
                puts l
            end
        else 
            puts "Hmmm...that doesn't seem quite right.".colorize(:light_red)
        end
    end

    def random
        Quartermaster::API.get_items
        randomizer = MagicItem.all.sample
        Quartermaster::API.item_details(randomizer)

        puts "Name: #{randomizer.name}".colorize(:light_yellow)
        puts "Type: #{randomizer.desc[0]}".colorize(:light_green)
        puts "Desc:"

        randomizer.desc[1..100].each do |l|
            puts l
        end
    end

    def exit_prompt
        puts " "
        puts "Would you like to take another gander? (y/n)".colorize(:light_blue)
        exit_input = gets.strip.chomp
        if exit_input == "y"
            puts "Would you like to browse or receive a random gift? (browse/random)".colorize(:light_blue)
            final_input = gets.strip.chomp
            if final_input == "browse"
                MagicItem.clear
                display_items
                mag_input = gets.strip.to_i
                display_magic_item(mag_input)
            elsif final_input == "random"
                random
            end
        exit_prompt
        end 
    end   
end