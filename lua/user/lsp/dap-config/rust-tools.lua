-- local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/'
local extension_path = '/home/swaroop/.local/share/nvim/mason/packages/codelldb/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb'


local this_os = vim.loop.os_uname().sysname;

-- The path in windows is different
if this_os:find "Windows" then
  codelldb_path = package_path .. "adapter\\codelldb.exe"
  liblldb_path = package_path .. "lldb\\bin\\liblldb.dll"
else
  -- The liblldb extension is .so for linux and .dylib for macOS
  liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
end

-- local opts = {

--     -- ... other configs
--     dap = {
--         adapter = require('rust-tools.dap').get_codelldb_adapter(
--             codelldb_path, liblldb_path)
--     }
-- }

-- -- Normal setup
-- require('rust-tools').setup(opts)

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },

    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    }
})
