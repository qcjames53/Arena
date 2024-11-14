# A recursive function to determine the next digit when converting an integer to hexedecimal
# say arena:util/int_to_hex_helper inputs: #input:v; outputs: arena:data{str2}
# Run as anything. Before calling, set arena:data{str1} + arena:data{str2} to blank strings.

# Determine the digit to concat + prepend to string
scoreboard players operation #current_digit v = #input v
scoreboard players operation #current_digit v %= #16 v
function arena:util/int_to_hex_set_string
function arena:util/reverse_concat with storage arena:data

# Continue recursion
scoreboard players operation #input v /= #16 v
execute if score #input v matches 1.. run function arena:util/int_to_hex