#> whimc:barrelbot/editor/outline/delete
#   Deletes the linked outline

kill @e[type=text_display,tag=whimc.editor_outline,predicate=whimc:barrelbot/match_id]
kill @e[type=interaction,tag=whimc.editor_node,predicate=whimc:barrelbot/match_id]
kill @e[type=item_display,tag=whimc.node_display,predicate=whimc:barrelbot/match_id]