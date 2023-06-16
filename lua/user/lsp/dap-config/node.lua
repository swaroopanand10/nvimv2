
-- Node 
-- this was working but node2 is outdated
-- dap.adapters.node2 = {
--   type = 'executable',
--   command = 'node',
--   -- args = {os.getenv('HOME') .. '/.local/share/nvim/mason/packages/node2-debug2-adapter/out/src/nodeDebug.js'},
--   args = {'/home/swaroop/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js'},
-- }

-- dap.configurations.javascript = {
--   {
--     name = 'Launch',
--     type = 'node2',
--     request = 'launch',
--     program = '${file}',
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = 'inspector',
--     console = 'integratedTerminal',
--   },
--   {
--     -- For this to work you need to make sure the node process is started with the `--inspect` flag.
--     name = 'Attach to process',
--     type = 'node2',
--     request = 'attach',
--     processId = require'dap.utils'.pick_process,
--   },
-- }

-- this is the latest
require("dap").adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    -- 💀 Make sure to update this path to point to your installation
    -- args = {"/path/to/js-debug/src/dapDebugServer.js", "${port}"},
    -- args = {"/path/to/js-debug/src/dapDebugServer.js", "${port}"},
    args = {"/home/swaroop/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}"},
  }
}
require("dap").configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}
