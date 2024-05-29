data modify storage kmc:io text_input set from entity @s SelectedItem.tag.pages
function #kmc:hook/text_input/process_input
function kmc.ui:api/close_prompt
