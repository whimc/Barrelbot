#> whimc:barrelbot/functions/load_instruction_from_function
#   Loads a singular instruction from a function

$data modify storage whimc:storage item_data set from storage whimc:storage functions[{id:'$(function)'}].function[{Slot:$(step)b}]