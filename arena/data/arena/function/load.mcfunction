say load

# Add scoreboard vars
scoreboard objectives add v dummy

# arena_wander_mode defs
# 0 - freeze
# 1 - walk/wander
# 2 - dig horizontal
# 3 - dig up diagonal
# 4 - dig down diagonal
# 5 - dig straight down
# 6 - pillar up
scoreboard objectives add pf_wander_mode dummy

scoreboard objectives add pf_target dummy
scoreboard objectives add pf_x dummy
scoreboard objectives add pf_y dummy
scoreboard objectives add pf_z dummy
scoreboard objectives add pf_cycles_on_block dummy
scoreboard objectives add freeze_timeout dummy
scoreboard objectives add pf_uuid dummy
scoreboard objectives add pf_think_cycles_without_follower_check_in dummy

# Set scoreboard vars
scoreboard players set #16 v 16
execute unless score #pf_minimum_uuid v matches 0.. run scoreboard players set #pf_minimum_uuid v 0
scoreboard players set #debug_mode_flag v 1

# Set up teams
team add nopush
team modify nopush collisionRule never

# Run debug commands
execute if score #debug_mode_flag v matches 1 run function arena:testing/debug_reset