tag @s add follower
scoreboard players operation @s pf_uuid = #pf_minimum_uuid v
team join nopush @s
data merge entity @s {CanPickUpLoot:0b,ArmorDropChances:[0.000F,0.000F,0.000F,0.000F]}

execute if score #pf_summon_level v matches 1 run return run \
  function arena:follower/summon_helpers/lvl1
execute if score #pf_summon_level v matches 2 run return run \
  function arena:follower/summon_helpers/lvl2
execute if score #pf_summon_level v matches 3 run return run \
  function arena:follower/summon_helpers/lvl3