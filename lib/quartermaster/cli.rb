class Quartermaster::CLI

    def call
        greeting
        input = gets.strip.chomp
        display_items(input)
        mag_input = gets.strip.to_i
        display_magic_item(mag_input)
    end

    def greeting
        puts "Greetings morningrider.".colorize(:light_blue)
        puts "I am Severn Desh, quartermaster of all things arcane.".colorize(:light_blue)
        puts "Would you like to see my offerings? (y/n)".colorize(:light_blue)
    end

    def display_items(input)
        if input == "y"
            puts "Let's see what we have here..."
            puts " "
            Quartermaster::API.get_items
            MagicItem.all.each.with_index(1) do |magic_item, index|
                puts "#{index}. #{magic_item.name}"
            end
            puts " "
            puts "Which item would you like to review? (Choose Number or 'exit' to walk away...for your own good.)".colorize(:light_blue)
        end
    end

    def display_magic_item(input = nil)
        puts "An interesting choice...".colorize(:light_blue)

        if input.to_i.between?(1, MagicItem.all.length) && input != "exit"
            magic_item = MagicItem.all[input - 1]
            Quartermaster::API.item_details(magic_item)
            
            puts "Name: #{magic_item.name}".colorize(:light_yellow)
            puts "Type: #{magic_item.desc[0]}"
            puts "Desc: #{magic_item.desc[1..20].join(",")}"
        end
        puts " "
        puts "Would you like to take another gander? (y/n)".colorize(:light_blue)
        exit_input = gets.strip 
        if exit_input == "y"
            MagicItem.clear
            display_items(exit_input)
            mag_input = gets.strip.to_i
            display_magic_item(mag_input)
        end
    end
    
end