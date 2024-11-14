# Try breaking blocks on current coord first
execute unless block ~ ~2 ~ #minecraft:replaceable run return run \
    function arena:pathfinder/think_helpers/attempt_block_break

# If continuing, determine where to dig / place platform
execute if score #target_angle_x v matches -135..-45 positioned ~1 ~ ~ run return run \
    function arena:pathfinder/think_helpers/action_up_angle_surfaces
execute if score #target_angle_x v matches -45..45 positioned ~ ~ ~1 run return run \
    function arena:pathfinder/think_helpers/action_up_angle_surfaces
execute if score #target_angle_x v matches 45..135 positioned ~-1 ~ ~ run return run \
    function arena:pathfinder/think_helpers/action_up_angle_surfaces
execute positioned ~ ~ ~-1 run function arena:pathfinder/think_helpers/action_up_angle_surfaces