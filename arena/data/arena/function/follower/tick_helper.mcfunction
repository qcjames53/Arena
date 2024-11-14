# Follower actions to run each tick.
# $say arena:follower/tick_helper inputs: $(current_uuid)

$data modify storage arena:data current_uuid_string set from storage arena:data uuid[$(current_uuid)]
function arena:follower/tick_helper_2 with storage arena:data