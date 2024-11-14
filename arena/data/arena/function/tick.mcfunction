# Run follower functions each tick
execute as @e[tag=follower] run function arena:follower/tick

# Allow a number of the pathfinders to think
execute as @e[tag=pathfinder, sort=random, limit=100] at @s run function arena:pathfinder/think

# Allow a number of mlg bucket entities to clean up
execute as @e[tag=pathfinder_water_cleanup, sort=random, limit=100] at @s run \
    function arena:pathfinder/think_helpers/mlg_bucket_cleanup
execute as @e[tag=pathfinder_platform_place, sort=random, limit=100] at @s run \
    function arena:pathfinder/think_helpers/delayed_platform_place