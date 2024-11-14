# This function is called when datapack is loaded in debug mode
say --- debug reset ----
# Call as anything.

kill @e[tag=pathfinder]
kill @e[tag=follower]
scoreboard players set #pf_minimum_uuid v 0
data modify storage arena:data uuid set value []

function arena:testing/reset_testing_arena