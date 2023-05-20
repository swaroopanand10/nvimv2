require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}

--setting for vim surround
vim.cmd[[set timeout timeoutlen=100]] -- this feature can cause some problems in time etc
