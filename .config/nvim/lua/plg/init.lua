local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git',
    'clone',
    '--depth', '1',
    'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

local function smoothieInit()
  local map = vim.api.nvim_set_keymap
  vim.g['smoothie_remapped_commands'] = {'<C-D>', '<C-U>', '<C-F>', '<S-Down>', '<PageDown>', '<C-B>', '<S-Up>', '<PageUp>', 'z+', 'z^', 'zt', 'z<CR>', 'z.', 'z-', 'zb'}
end

local function setTheme(name)
  themeName = name
  vim.cmd('colorscheme ' .. name)
end

return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'
  use
    {
      'gruvbox-community/gruvbox',
      setup = setTheme('gruvbox')
    }
  use 'rust-lang/rust.vim'
  use 'ap/vim-css-color'
  use 'mattn/emmet-vim'
  use
    {
      'psliwka/vim-smoothie',
      setup = smoothieInit()
    }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
