say up
# First, try breaking block above
execute positioned ~ ~3 ~ run function arena:pathfinder/think_helpers/attempt_block_break

# Then pillar up 
execute align xyz run tp @s ~0.5 ~ ~0.5
data merge entity @s {Motion:[0.0,0.4,0.0]}
execute summon minecraft:marker run \
    function arena:pathfinder/think_helpers/delayed_platform_create