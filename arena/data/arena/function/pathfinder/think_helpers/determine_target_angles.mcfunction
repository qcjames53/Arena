$execute facing $(x) $(y) $(z) run tp @s ~ ~ ~ ~ ~
execute store result score #target_angle_x v run data get entity @s Rotation[0]
execute store result score #target_angle_y v run data get entity @s Rotation[1]
kill @s