#> Inputs:
#   whimc:macro puzzle_type     < Numerical ID of the puzzle's type

#> Outputs:
#   whimc:storage puzzle_name   < Name of the puzzle - If there is none, create one

with storage whimc:macro:
    $execute unless data storage whimc:storage puzzle_names[{puzzle_id:$(puzzle_type)}] run data modify storage whimc:storage puzzle_names append value {puzzle_id:$(puzzle_type),Name:"Puzzle #$(puzzle_type)"}
    $data modify storage whimc:storage puzzle_name set from storage whimc:storage puzzle_names[{puzzle_id:$(puzzle_type)}].Name