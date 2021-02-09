class Quartermaster::CLI

    def call
        greeting
        input = gets.strip.chomp
        #display_categories(input)
        #cat_input = gets.strip.to_i
        #display_items(cat_input) - prints out list of items based on category
        display_items(input)
        mag_input = gets.strip.to_i
        display_magic_item(mag_input)
        
        #DONE present user with equipment categories
        #get user input - based on index number they select
        #present user with a list of items of the categories they selected
            #get items from API
            #iterate over items and assign their stats to a new object
            #put out the item stats and details in a presentable way
        #ask user whether they would like to search for another item

    end

    def greeting
        puts "Greetings morningrider."
        puts "I am Severn Desh, quartermaster of all things arcane."
        puts "Would you like to see my offerings? (y/n)"
    end

    def display_categories(input)
        if input == "y"
            puts "What exactly are you looking for? (Enter Number)"
            puts "1. Armor"
            puts "2. Ammunition"
            puts "3. Potions"
            puts "4. Rings"
            puts "5. Rods"
            puts "6. Scrolls"
            puts "7. Staffs"
            puts "8. Wands"
            puts "9. Weapons"
            puts "10. Some of my most Wondrous Items"
        end
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
            puts "Which item would you like to review? (Choose Number or 'exit' to walk away...for your own good.)"
        end
    end

    def display_magic_item(input)
        if input.to_i.between?(1, MagicItem.all.length) && input != "exit"
            magic_item = MagicItem.all[input - 1]
            Quartermaster::API.item_details(magic_item)
            
            puts "Name: #{magic_item.name}"
            puts "Type: #{magic_item.desc[0]}"
            puts "Desc: #{magic_item.desc[1..20]}"
        end
        puts " "
        puts "Would you like to take another gander? (y/n)"
        exit_input = gets.strip 
        if exit_input == "y"
            MagicItem.clear
            display_items(exit_input)
            mag_input = gets.strip.to_i
            display_magic_item(mag_input)
        end
    end

end