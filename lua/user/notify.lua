require("notify").setup{
 background_colour = "NotifyBackground",
    fps = 30,
    icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = ""
    },
    level = 2,
    minimum_width = 50,
    maximum_width = 200,
    -- render = "default",
    -- stages = "fade_in_slide_out",
    timeout = 1000,
    top_down = true
}

vim.notify = require('notify')
