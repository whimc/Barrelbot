$execute unless data storage whimc:storage puzzle_names[{puzzle_id:$(puzzle_type)}] run data modify storage whimc:storage puzzle_names append value {puzzle_id:$(puzzle_type),Name:"Puzzle #$(puzzle_type)"}
$data modify storage whimc:storage puzzle_name set from storage whimc:storage puzzle_names[{puzzle_id:$(puzzle_type)}].Name
