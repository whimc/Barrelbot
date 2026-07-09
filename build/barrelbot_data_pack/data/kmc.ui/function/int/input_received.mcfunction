advancement revoke @s only kmc:text_input/receive_input
execute if data entity @s SelectedItem.components."minecraft:writable_book_content".pages[] run function kmc.ui:int/input_received/nested_execute_0
function #kmc:hook/text_input/process_input
function kmc.ui:api/close_prompt
