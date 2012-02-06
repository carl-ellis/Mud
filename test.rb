require './item.rb'
require './mob.rb'
require './area.rb'
require './storage/json/item_json.rb'
require './storage/json/item_template_json.rb'
require './storage/json/mob_json.rb'
require './storage/json/mob_template_json.rb'
require './storage/json/room_json.rb'
require './storage/json/area_json.rb'

it = ItemTemplate.new(1, "hat", "a mighty fine hat", 0.3)
i = Item.new(1, 0.4, it)

mt = MobTemplate.new(1, "grue", "a scary grue is here to get you", 10)
m = Mob.new(1, 9, mt)

r = Room.new(1, "West Desk", "It's your desk", 0, [i], [m], [])
a = Area.new(1, "Office", [r])

puts it.to_json
puts ""
puts i.to_json
puts ""
puts mt.to_json
puts ""
puts m.to_json
puts ""
puts r.to_json
puts ""
puts a.to_json
puts ""
