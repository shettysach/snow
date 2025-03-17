$env.config.show_banner = false

$env.config.completions.algorithm = "fuzzy"

$env.config.edit_mode = "vi"
$env.config.cursor_shape.vi_insert = "line"
$env.config.cursor_shape.vi_normal = "block"

$env.PROMPT_INDICATOR_VI_NORMAL = ""
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = "  "

$env.config = {
    menus: [
      {
        name: completion_menu
        only_buffer_difference: false 
        marker: ""
        type: {
            layout: columnar          
            columns: 1                
        }
        style: {
            text: white                   
            selected_text: green_reverse
            description_text: blue
        }
      }

      {
        name: history_menu
        only_buffer_difference: false
        marker: ""
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: white
            selected_text: green_reverse
            description_text: blue
        }
      }
    ]
}
