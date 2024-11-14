
# Be careful to make sure this append never goes out of sync with UUID length
# TODO - make this more robust with inserts / appends when no space
$data modify storage arena:data uuid append value "$(str2)"