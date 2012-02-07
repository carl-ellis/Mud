require './core/item.rb'
require './core/mob.rb'
require './core/area.rb'
require './storage/json/item_json.rb'
require './storage/json/item_template_json.rb'
require './storage/json/mob_json.rb'
require './storage/json/mob_template_json.rb'
require './storage/json/room_json.rb'
require './storage/json/area_json.rb'
require './storage/json/door_json.rb'

it = ItemTemplate.new(1, "hat", "a mighty fine hat", 0.3)
i = Item.new(1, 0.4, it)

mt = MobTemplate.new(1, "grue", "a scary grue is here to get you", 10)
m = Mob.new(1, 9, mt)

e = Door.new(Door::CLEAR)
r1 = Room.new(1, "West Desk", "It's your desk", 0, [i], [], [], {}, {})
r2 = Room.new(2, "East Desk", "It's not your desk", 0, [], [m], [], {}, {})
r1.connect(r2, Direction::EAST, e)
a = Area.new(1, "Office", [r1, r2])

puts it.to_json
puts i.to_json
puts mt.to_json
puts m.to_json
puts r1.to_json
puts r2.to_json
puts a.to_json
puts e.to_json
