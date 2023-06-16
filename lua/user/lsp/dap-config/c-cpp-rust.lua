local dap = require('dap')

--C/CPP via codelldb
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    -- command = '/absolute/path/to/codelldb/extension/adapter/codelldb',
	-- command = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.9.2/adapter/codelldb",
	-- command = "/home/swaroop/.vscode/extensions/vadimcn.vscode-lldb-1.9.2/adapter/codelldb",
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
    -- stopOnEntry = false,
    stopOnEntry = true,
     runInTerminal = true,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
