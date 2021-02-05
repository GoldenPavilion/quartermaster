class Quartermaster::API

    def self.get_items
        get_items = RestClient.get('https://www.dnd5eapi.co/api/magic-items')
        @items = JSON.parse(get_items)["results"]

        @items.each do |magic_item|
            MagicItem.new(name: magic_item["name"], index: magic_item["index"])
        end
    end

    def self.item_details(magic_item)
        url = 'https://www.dnd5eapi.co/api/magic-items/#{magic_item.index}'
        get_item = RestClient.get(url)
        @magic_item = JSON.parse(get_item)
    end

end