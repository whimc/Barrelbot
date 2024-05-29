#> whimc:barrelbot/editor/edit_wand/edit_mode/edit_tick
#   Does tickly updates on the player while editing

data remove storage whimc:storage ClickedButton
function whimc:barrelbot/editor/edit_wand/math/find_selected_button
title @s actionbar {"nbt":"ClickedButton.hover_text","storage":"whimc:storage"}

execute unless predicate whimc:barrelbot/riding_edit_instance:
    tag @s remove whimc.in_edit_menu
    execute as @s[tag=kmc.ui.prompted] run function kmc.ui:api/close_prompt
    title @s actionbar ""
    execute as @e[type=item_display,tag=whimc.editor_base,predicate=!whimc:has_riding_player] run function whimc:barrelbot/editor/edit_wand/delete_edit_instance

scoreboard players operation $temp whimc.barrelbot.edit_instance_id = @s whimc.barrelbot.edit_instance_id
execute at @e[type=!player,predicate=whimc:barrelbot/match_edit_id,tag=whimc.edit_subject] align xyz:
    def drawline(p1, p2, steps):
        stepX = (p2[0] - p1[0]) / (steps - 1)
        stepY = (p2[1] - p1[1]) / (steps - 1)
        stepZ = (p2[2] - p1[2]) / (steps - 1)

        i = 0
        while i < steps:
            x = (p1[0] + i * stepX - 0.5) * 1.05 + 0.5
            y = (p1[1] + i * stepY - 0.5) * 1.05 + 0.5
            z = (p1[2] + i * stepZ - 0.5) * 1.05 + 0.5
            particle electric_spark ~x ~y ~z 0 0 0 0 0 force @s

            i += 1

    drawline([0, 0, 0], [0, 0, 1], 4)
    drawline([0, 0, 0], [0, 1, 0], 4)
    drawline([0, 0, 0], [1, 0, 0], 4)
    drawline([0, 1, 1], [1, 1, 1], 4)
    drawline([0, 1, 1], [0, 0, 1], 4)
    drawline([0, 1, 1], [0, 1, 0], 4)
    drawline([1, 1, 0], [1, 1, 1], 4)
    drawline([1, 1, 0], [1, 0, 0], 4)
    drawline([1, 1, 0], [0, 1, 0], 4)
    drawline([1, 0, 1], [1, 0, 0], 4)
    drawline([1, 0, 1], [1, 1, 1], 4)
    drawline([1, 0, 1], [0, 0, 1], 4)


