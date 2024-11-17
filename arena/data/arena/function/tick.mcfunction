# Allow a number of sumlocs to summon every 4 ticks
scoreboard players add #sumlock_tick v 1
execute if score #sumloc_tick v matches 4.. as @e[tag=sumloc] at @s run function arena:sumloc/call
execute if score #sumloc_tick v matches 4.. run scoreboard players set #sumloc_tick v 0

# Run follower functions each tick
execute as @e[tag=follower] run function arena:follower/tick

# Allow a number of the pathfinders to think
execute as @e[tag=pathfinder, sort=random, limit=100] at @s run function arena:pathfinder/think

# Allow a number of mlg bucket entities to clean up
execute as @e[tag=pathfinder_water_cleanup, sort=random, limit=100] at @s run \
    function arena:pathfinder/think_helpers/mlg_bucket_cleanup
execute as @e[tag=pathfinder_platform_place, sort=random, limit=100] at @s run \
    function arena:pathfinder/think_helpers/delayed_platform_place