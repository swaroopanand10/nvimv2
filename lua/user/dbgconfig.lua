-- PYTHON configurations here:

-- local venv = os.getenv("VIRTUAL_ENV")
-- command = vim.fn.getcwd() .. string.format("%s/bin/python",venv)

local dap = require('dap')

dap.adapters.python = {
  type = 'executable';
  -- command = '~/.config/nvim/dbg/debugpy/bin/python';
  -- command = os.getenv('HOME') .. '/.config/nvim/dbg/debugpy/bin/python';
  --[[ command = os.getenv('HOME') .. '/.local/share/nvim/dapinstall/python/bin/python'; ]]
  command = os.getenv('HOME') .. '/.local/share/nvim/mason/packages/debugpy/venv/bin/python';
  args = { '-m', 'debugpy.adapter' };
  
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}


-- C++/C/Rust config here:
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    -- command = '/usr/bin/lldb-vscode',
    -- command = '/absolute/path/to/codelldb/extension/adapter/codelldb',
    command = '/home/swaroop/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb',
    args = {"--port", "${port}"},
    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp


-- Node/javascript config here:

--[[ dap.adapters.node2 = { ]]
--[[   type = 'executable', ]]
--[[   command = 'node', ]]
--[[   args = {os.getenv('HOME') .. '.local/share/nvim/mason/packages/node-debug2-adapter/node-debug2-adapter'}, --not working for some reason ]]
--[[]]
--[[ } ]]
--[[ dap.configurations.javascript = { ]]
--[[   { ]]
--[[     name = 'Launch', ]]
--[[     type = 'node2', ]]
--[[     request = 'launch', ]]
--[[     program = '${file}', ]]
--[[     cwd = vim.fn.getcwd(), ]]
--[[     sourceMaps = true, ]]
--[[     protocol = 'inspector', ]]
--[[     console = 'integratedTerminal', ]]
--[[     port = 9222, ]]
--[[   }, ]]
--[[   { ]]
--[[     -- For this to work you need to make sure the node process is started with the `--inspect` flag. ]]
--[[     name = 'Attach to process', ]]
--[[     type = 'node2', ]]
--[[     cwd = vim.fn.getcwd(), ]]
--[[     program = '${file}', ]]
--[[     request = 'attach', ]]
--[[     processId = require'dap.utils'.pick_process, ]]
--[[     sourceMaps = true, ]]
--[[     port = 9222, ]]
--[[   }, ]]
--[[ } ]]


require("dap-vscode-js").setup({
   node_path = "node --inspect", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
   debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
   debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
})

for _, language in ipairs({ "typescript", "javascript" }) do
require("dap").configurations[language] = {
{
  {
    name = "Launch file",
    type = "pwa-node",
    request = "launch",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
  {
    name = "Attach",
    type = "pwa-node",
    request = "attach",
    processId = require'dap.utils'.pick_process,
    program = "${file}",
    cwd = "${workspaceFolder}",
  }
}
  }
end



    --[[ type = 'node2', ]]
    --[[ request = 'attach', ]]
    --[[ cwd = vim.fn.getcwd(), ]]
    --[[ sourceMaps = true, ]]
    --[[ protocol = 'inspector', ]]
    --[[ skipFiles = {'<node_internals>/**/*.js'}, ]]
