# An int to hex helper function to concat the next digit
# say arena:data/int_to_hex_concat_digit inputs: #current_digit:v; outputs: arena:data{str1}
# Run as anything

execute if score #current_digit v matches 0 run return run data merge storage arena:data {str1: "0"}
execute if score #current_digit v matches 1 run return run data merge storage arena:data {str1: "1"}
execute if score #current_digit v matches 2 run return run data merge storage arena:data {str1: "2"}
execute if score #current_digit v matches 3 run return run data merge storage arena:data {str1: "3"}
execute if score #current_digit v matches 4 run return run data merge storage arena:data {str1: "4"}
execute if score #current_digit v matches 5 run return run data merge storage arena:data {str1: "5"}
execute if score #current_digit v matches 6 run return run data merge storage arena:data {str1: "6"}
execute if score #current_digit v matches 7 run return run data merge storage arena:data {str1: "7"}
execute if score #current_digit v matches 8 run return run data merge storage arena:data {str1: "8"}
execute if score #current_digit v matches 9 run return run data merge storage arena:data {str1: "9"}
execute if score #current_digit v matches 10 run return run data merge storage arena:data {str1: "a"}
execute if score #current_digit v matches 11 run return run data merge storage arena:data {str1: "b"}
execute if score #current_digit v matches 12 run return run data merge storage arena:data {str1: "c"}
execute if score #current_digit v matches 13 run return run data merge storage arena:data {str1: "d"}
execute if score #current_digit v matches 14 run return run data merge storage arena:data {str1: "e"}
execute if score #current_digit v matches 15 run return run data merge storage arena:data {str1: "f"}