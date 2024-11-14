# Function to concatenate two strings
# $say arena:util/concat inputs: $(str1) $(str2); outputs: arena:data{str2}
# Run as anything

$data modify storage arena:data str2 set value "$(str1)$(str2)"