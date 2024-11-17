say loading...

### Pathfinder scoreboards ###
scoreboard objectives add pf_x dummy
scoreboard objectives add pf_y dummy
scoreboard objectives add pf_z dummy
scoreboard objectives add pf_cycles_on_block dummy
scoreboard objectives add pf_uuid dummy
scoreboard objectives add pf_think_cycles_without_follower_check_in dummy
# See sumloc_level defs for level info
scoreboard objectives add pf_level dummy
scoreboard objectives add pf_type dummy

### Sumloc scoreboards ### 
# sumloc_summon_chance - percent chance of summon on each summon call (5 per sec) from 0 to 100
scoreboard objectives add sumloc_chance dummy

### Other scoreboards ###
scoreboard objectives add v dummy

### Set scoreboard vars ###
scoreboard players set #16 v 16
execute unless score #pf_minimum_uuid v matches 0.. run scoreboard players set #pf_minimum_uuid v 0
scoreboard players set #debug_mode_flag v 1

### Set up teams ###
team add nopush
team modify nopush collisionRule never

### Run debug commands ###
execute if score #debug_mode_flag v matches 1 run function arena:testing/debug_reset