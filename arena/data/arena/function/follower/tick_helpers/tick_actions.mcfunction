# Follower actions to run each tick.
# $say arena:follower/tick_helper_2 inputs: $(current_uuid_string)

# If pathfinder is dead, kill self
$execute unless entity 0-0-0-0-$(current_uuid_string) run kill @s

# Tp to pathfinder and let them know you are alive
$execute at 0-0-0-0-$(current_uuid_string) rotated as 0-0-0-0-$(current_uuid_string) run tp @s ~ ~ ~ ~ ~
$scoreboard players set 0-0-0-0-$(current_uuid_string) pf_think_cycles_without_follower_check_in 0