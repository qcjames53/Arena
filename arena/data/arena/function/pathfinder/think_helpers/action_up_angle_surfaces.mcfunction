# Try breaking blocks first
execute unless block ~ ~1 ~ #minecraft:replaceable run return run \
    function arena:pathfinder/think_helpers/attempt_block_break
execute unless block ~ ~2 ~ #minecraft:replaceable positioned ~ ~1 ~ run return run \
    function arena:pathfinder/think_helpers/attempt_block_break

# Then try placing a platform
execute positioned ~ ~-1 ~ store result score #success v run \
    function arena:pathfinder/think_helpers/attempt_platform_place
execute if score #success v matches 1 run return 1
function arena:pathfinder/think_helpers/attempt_platform_place