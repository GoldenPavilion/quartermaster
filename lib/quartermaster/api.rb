class Quartermaster::API

    def self.get_items
        get_items = RestClient.get('https://www.dnd5eapi.co/api/magic-items')
        @items = JSON.parse(get_items)
    end

end