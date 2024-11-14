# Try breaking blocks first
execute unless block ~ ~ ~ #minecraft:replaceable run return run \
    function arena:pathfinder/think_helpers/attempt_block_break
execute unless block ~ ~1 ~ #minecraft:replaceable positioned ~ ~1 ~ run return run \
    function arena:pathfinder/think_helpers/attempt_block_break

# Then try placing a platform
execute unless block ~ ~-1 ~ #minecraft:replaceable run return 1
setblock ~ ~-1 ~ minecraft:waxed_weathered_copper_grate
playsound minecraft:block.copper.place block @a ~ ~-1 ~ 1