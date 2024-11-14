execute if score @s pf_x = #temp pf_x if score @s pf_y = #temp pf_y \
    if score @s pf_z = #temp pf_z run return run scoreboard players add @s pf_cycles_on_block 1
scoreboard players set @s pf_cycles_on_block 0