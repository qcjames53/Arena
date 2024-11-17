# Summon the pathfinder wandering trader entity
# $say arena:pathfinder/summon_helpers/wandering_trader inputs: $(uuid_int)

$summon wandering_trader ~ ~ ~ {\
  Silent:1b,\
  Invulnerable:1b,\
  UUID:[I;0,0,0,$(uuid_int)],\
  CanPickUpLoot:0b,\
  Tags:["pathfinder", "level_update_needed"],\
  Team:"nopush",\
  Offers:{}\
}

execute as @e[tag=pathfinder, tag=level_update_needed, limit=1, sort=nearest] run \
  function arena:pathfunder/summon_helpers/set_attributes