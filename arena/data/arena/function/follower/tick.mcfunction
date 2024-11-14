# Follower actions to run each tick.
# say arena:follower/tick

execute store result storage arena:data current_uuid int 1 run scoreboard players get @s pf_uuid
function arena:follower/tick_helper with storage arena:data