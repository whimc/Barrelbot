$execute unless data storage whimc:storage puzzle_names[{puzzle_id:$(puzzle_id)}] run data modify storage whimc:storage puzzle_names append value {puzzle_id:$(puzzle_id)}
$data modify storage whimc:storage puzzle_names[{puzzle_id:$(puzzle_id)}].Name set from storage kmc:io text_input[0]
