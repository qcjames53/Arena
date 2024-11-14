execute if score @s pf_cycles_on_block matches ..5 run return run \
    scoreboard players add @s pf_cycles_on_block 1
execute if block ~ ~ ~ #minecraft:replaceable run \
    setblock ~ ~ ~ minecraft:waxed_weathered_copper_grate
playsound minecraft:block.copper.place block @a ~ ~ ~ 1
kill @s