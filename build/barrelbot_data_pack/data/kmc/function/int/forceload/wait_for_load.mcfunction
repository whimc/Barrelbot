execute store result score #chunk_loaded kmc if loaded 0 0 0 run function #kmc:hook/on_load_origin
execute if score #chunk_loaded kmc matches 0 run schedule function kmc:int/forceload/wait_for_load 1 append
