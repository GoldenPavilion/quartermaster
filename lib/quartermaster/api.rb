class Quartermaster::API

    def self.get_items
        get_items = RestClient.get('https://www.dnd5eapi.co/api/magic-items')
        @items = JSON.parse(get_items)["results"]

        @items.each do |magic_item|
            MagicItem.new(magic_item["name"], magic_item["index"])
            binding.pry
        end
    end

    def self.item_details
        url = 'https://www.dnd5eapi.co/api/magic-items/adamantine-armor'
        get_item = RestClient.get(url)
        @magic_item = JSON.parse(get_item)

        magic_item.equip_category["equipment-category"]
        magic_item.desc["desc"]
    end

end