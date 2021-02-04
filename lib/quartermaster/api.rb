class Quartermaster::API

    def get_item
        items = RestClient.get('https://www.dnd5eapi.co/api/magic-items')
        @items = JSON.parse(items)
        binding.pry
    end

end