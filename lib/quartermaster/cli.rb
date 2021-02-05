class Quartermaster::CLI

    def call
        greeting
        Quartermaster::API.get_items
        binding.pry
        #present user with equipment categories
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
        puts "What exactly are you looking for?"
    end
end