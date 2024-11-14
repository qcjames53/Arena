execute if score @s pf_cycles_on_block matches ..6 run return run \
    scoreboard players add @s pf_cycles_on_block 1
execute if block ~ ~ ~ minecraft:water run setblock ~ ~ ~ minecraft:air
kill @s