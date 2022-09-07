local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'morhetz/gruvbox'
  use 'mjlbach/onedark.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'zefei/vim-colortuner'
  use 'windwp/nvim-autopairs'
  use 'luochen1990/rainbow'
  use 'rust-lang/rust.vim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)