advancement revoke @s only kmc.ui:text_input/receive_input
execute if data entity @s SelectedItem.tag.pages[] run function kmc.ui:int/input_received/nested_execute_0
