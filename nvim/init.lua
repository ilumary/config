require('plugins')
require('lsp')

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd([[
	so ~/.config/nvim/legacy.vim
]])

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },
}

require('nvimcmp')

require('nvim-autopairs').setup {}

require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
    },
}

