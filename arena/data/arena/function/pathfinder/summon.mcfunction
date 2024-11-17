# Summon a pathfinder entity + an attatched follower at the calling location
# say arena:pathfinder/summon inputs: #pf_summon_level, #pf_summon_type
# Run as anything at location to summon.

# Inputs:
# #pf_summon_level: set scoreboard value before calling summon
#   0 - No AI, standard mob (no helmet)
#   1 - Pathfinder (leather helmet)
#   2 - Pathfinder + Can break blocks (iron helmet)
#   3 - Pathfinder + Can place and break blocks (diamond helmet)
# 
# #pf_summon_type: set scoreboard value before calling summon
#   0 - skeleton
#   1 - skeleton + bow

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