
# Handle follower check in. If gone 3 think cycles without follower check in, kill off.
scoreboard players add @s pf_think_cycles_without_follower_check_in 1
execute if score @s pf_think_cycles_without_follower_check_in matches 3.. run kill @s

# Compare the stored pos to the entity pos
# If same, add block tick
# If different, reset block tick
data modify storage arena:data Pos set from entity @s Pos
execute store result score #temp pf_x run data get storage arena:data Pos[0]
execute store result score #temp pf_y run data get storage arena:data Pos[1]
execute store result score #temp pf_z run data get storage arena:data Pos[2]
function arena:pathfinder/think_helpers/adjust_cycles_on_block

# Set stored pos to current for next tick
execute store result score @s pf_x run data get storage arena:data Pos[0]
execute store result score @s pf_y run data get storage arena:data Pos[1]
execute store result score @s pf_z run data get storage arena:data Pos[2]

# Attempt mlg bucket if falling and path is clear
# Entity will fall around 4 blocks per tick at terminal velocity, meaning this has around
# a 1 in 4 chance of working at those speeds
execute if block ~ ~ ~ #minecraft:air \
    if block ~ ~-1 ~ #minecraft:air \
    if block ~ ~-2 ~ #minecraft:air \
    if block ~ ~-3 ~ #minecraft:replaceable \
    unless block ~ ~-3 ~ minecraft:water \
    unless block ~ ~-4 ~ #minecraft:replaceable \
    positioned ~ ~-3 ~ summon marker \
    run function arena:pathfinder/think_helpers/mlg_bucket_create

# Determine if the pf will make an action. Chance increases the longer they are on the same block
execute store result score #think_roll v run random value 0..30
scoreboard players operation #think_roll v += @s pf_cycles_on_block
execute unless score #think_roll v matches 40.. run return 1

# Action has been chosen to take place
scoreboard players set @s pf_cycles_on_block 0

# Set the pathfinder target
data modify storage arena:data Pos set from entity @p Pos
data modify storage arena:data target_coords.x set from storage arena:data Pos[0]
data modify storage arena:data target_coords.y set from storage arena:data Pos[1]
data modify storage arena:data target_coords.z set from storage arena:data Pos[2]
data modify storage arena:data target_coords_arr set value [I;0,0,0]
data modify storage arena:data target_coords_arr[0] set from storage arena:data target_coords.x
data modify storage arena:data target_coords_arr[1] set from storage arena:data target_coords.y
data modify storage arena:data target_coords_arr[2] set from storage arena:data target_coords.z
data modify entity @s wander_target set from storage arena:data target_coords_arr

# If falling, no action
execute if block ~ ~-1 ~ #minecraft:air run return 1

# If inside block, attempt breaking them
execute unless block ~ ~ ~ #minecraft:replaceable run return run \
    function arena:pathfinder/think_helpers/attempt_block_break
execute unless block ~ ~1 ~ #minecraft:replaceable positioned ~ ~1 ~ run return run \
    function arena:pathfinder/think_helpers/attempt_block_break

# Get the vertical and horizontal angle to the target
execute summon minecraft:marker run function \
    arena:pathfinder/think_helpers/determine_target_angles with storage arena:data target_coords

# Take action based on vertical angle (-90 is up, 90 is down):
#   -90  dig up if blocked then pillar
#   -45  dig step up if blocked then build step
#     0  dig tunnel if blocked then build platform
#    45  dig step down if blocked, otherwise built horizontal platform
#    90  dig down if blocked
# Use random blend between results starting at 10 degrees seperation
execute store result score #think_roll v run random value 0..25
scoreboard players operation #think_roll v += #target_angle_y v
execute if score #think_roll v matches 80.. run return run \
    function arena:pathfinder/think_helpers/action_down
execute if score #think_roll v matches -10.. run return run \
    function arena:pathfinder/think_helpers/action_level
execute if score #think_roll v matches -55.. run return run \
    function arena:pathfinder/think_helpers/action_up_angle
return run function arena:pathfinder/think_helpers/action_up