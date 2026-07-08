$execute unless data storage whimc:storage puzzle_instances[{id:$(id)}] run data modify storage whimc:storage puzzle_instances append value {id:$(id),type:$(type),x:$(x),y:$(y),z:$(z)}
$execute if data storage whimc:storage puzzle_instances[{id:$(id)}] run data modify storage whimc:storage puzzle_instances[{id:$(id)}] set value {id:$(id),type:$(type),x:$(x),y:$(y),z:$(z)}
