scoreboard players set $success whimc.dummy 1
$function whimc:barrelbot/bot_success_conditions/$(function)
execute if score $success whimc.dummy matches 0 run scoreboard players set $failure_found whimc.dummy 1
