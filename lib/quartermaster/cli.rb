class Quartermaster::CLI

    def call
        greeting
        #input = gets.strip.chomp
        #display_categories(input)
        #cat_input = gets.strip.to_i
        #display_items(cat_input ) - prints out list of items based on category

        Quartermaster::API.get_items
        
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
end