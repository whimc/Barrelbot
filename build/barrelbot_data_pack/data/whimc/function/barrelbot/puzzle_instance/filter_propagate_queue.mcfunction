execute unless data storage whimc:storage propagate_candidates[0] run return 0
execute store result score $cand_id whimc.dummy run data get storage whimc:storage propagate_candidates[0].id
execute store result score $cand_type whimc.dummy run data get storage whimc:storage propagate_candidates[0].type
execute if score $cand_type whimc.dummy = $temp whimc.barrelbot.puzzle_type_id unless score $cand_id whimc.dummy = $source_puzzle_id whimc.dummy run data modify storage whimc:storage propagate_queue append from storage whimc:storage propagate_candidates[0]
data remove storage whimc:storage propagate_candidates[0]
function whimc:barrelbot/puzzle_instance/filter_propagate_queue
