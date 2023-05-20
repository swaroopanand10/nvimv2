local dap = require("dap")

require ('mason-nvim-dap').setup({
    ensure_installed = {'stylua', 'jq'}
})

require 'mason-nvim-dap'.setup_handlers {
    function(source_name)
      -- all sources with no handler get passed here
    end,
    python = function()
        dap.adapters.python = {
          type = "executable",
          command = "/usr/bin/python3",
          args = {
            "-m",
            "debugpy.adapter",
          },
        }

        dap.configurations.python = {
          {
            type = "python",
            request = "launch",
            name = "Launch file",
            program = "${file}", -- This configuration will launch the current file if used.
          },
        }
    end,
}
