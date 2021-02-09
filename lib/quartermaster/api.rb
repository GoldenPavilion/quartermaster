class Quartermaster::API

    def self.get_items
        get_items = RestClient.get("https://www.dnd5eapi.co/api/magic-items")
        @items = JSON.parse(get_items)["results"]

        @items.each do |magic_item|
            MagicItem.new(magic_item["name"], magic_item["index"])
        end
    end

    def self.item_details(magic_item)
        get_item = RestClient.get("https://www.dnd5eapi.co/api/magic-items/#{magic_item.index}")
        magic_item_info = JSON.parse(get_item)

        magic_item.equip_category = magic_item_info["equipment_category"]["name"]
        magic_item.desc = magic_item_info["desc"]
    end

end