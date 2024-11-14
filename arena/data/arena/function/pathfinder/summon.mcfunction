# Summon a pathfinder entity + an attatched follower at the calling location
# say arena:pathfinder/summon
# Run as anything at location to summon.

# Determine next UUID int + string
execute store result storage arena:data uuid_int int 1 run scoreboard players get #pf_minimum_uuid v
scoreboard players operation #input v = #pf_minimum_uuid v
data merge storage arena:data {str1: "", str2: ""}
function arena:util/int_to_hex

# Update UUID table (uses str2)
function arena:pathfinder/summon_helpers/update_uuid_table with storage arena:data

# Summon pathfinder entity with UUID int
function arena:pathfinder/summon_helpers/wandering_trader with storage arena:data

# Summon appropriate follower tracking UUID string
function arena:follower/summon

# Increment pf_minimum_uuid
scoreboard players add #pf_minimum_uuid v 1