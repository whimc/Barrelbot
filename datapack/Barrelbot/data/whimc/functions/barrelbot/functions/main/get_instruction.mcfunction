#> whimc:barrelbot/functions/main/get_instruction

data modify storage whimc:storage current_step set value {}
$data modify storage whimc:storage current_step set from storage whimc:storage marker_data.instructions[{Slot:$(step)b}].tag.barrelbot