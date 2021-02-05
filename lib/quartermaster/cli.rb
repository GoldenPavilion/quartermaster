class Quartermaster::CLI

    def call
        greeting
        Quartermaster::API.get_items
        binding.pry
    end

    def greeting
        puts "Greetings morningrider."
        puts "I am Severn Desh, quartermaster of all things arcane."
        puts "Would you like to see my inventory?"
        puts "Careful what you pick. Not everything is as it seems."
    end
end