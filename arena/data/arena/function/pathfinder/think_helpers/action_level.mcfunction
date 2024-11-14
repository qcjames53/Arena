# Determine where to dig / place platform
execute if score #target_angle_x v matches -135..-45 positioned ~1 ~ ~ run return run \
    function arena:pathfinder/think_helpers/action_level_surfaces
execute if score #target_angle_x v matches -45..45 positioned ~ ~ ~1 run return run \
    function arena:pathfinder/think_helpers/action_level_surfaces
execute if score #target_angle_x v matches 45..135 positioned ~-1 ~ ~ run return run \
    function arena:pathfinder/think_helpers/action_level_surfaces
execute positioned ~ ~ ~-1 run function arena:pathfinder/think_helpers/action_level_surfaces
