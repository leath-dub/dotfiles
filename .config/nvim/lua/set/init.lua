vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.fileencoding = 'utf-8'

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

vim.opt.listchars = {
  space = '·',
  extends = '<',
  precedes = '>',
  trail = '¬',
  tab = '| '
}
-- function to set indent display
function indentLine()
  -- indent_str = '¦'
  local indent_str = '▏'
  indent = vim.opt.shiftwidth:get()
  while (indent > 1) do
    indent_str = indent_str .. ' '
    indent = indent - 1
  end
  vim.opt.listchars:append({ multispace = indent_str })
end
-- can call indentLine to update, say if you changed shiftwidth
indentLine()
vim.opt.fillchars = { eob = '\\' }

vim.opt.list = true
vim.opt.laststatus = 2
vim.opt.colorcolumn = '80'
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'

-- autocmds
local acmd = vim.api.nvim_create_autocmd

acmd({"TermOpen"}, {pattern = {"*"}, command = "setlocal nonumber norelativenumber"})
acmd({"TermOpen"}, {pattern = {"*"}, command = "setlocal signcolumn=no"})
acmd({"BufRead", "BufNewFile"}, { pattern = {"*.ms", "*.me", "*.mom"}, command = "setlocal filetype=groff"})
acmd({"BufRead", "BufNewFile"}, {pattern = {"*.mkd", "*.md", "*.mdown", "*.markdown"}, command = "setlocal spell"})

vim.cmd('filetype plugin on')
acmd({"FileType"}, {pattern = { "php" }, command = "setl ofu=phpcomplete#CompletePHP"})
acmd({"FileType"}, {pattern = { "ruby", "eruby" }, command = "setl ofu=rubycomplete#Complete"})
acmd({"FileType"}, {pattern = { "html", "xhtml" }, command = "setl ofu=htmlcomplete#CompleteTags"})
acmd({"FileType"}, {pattern = { "c" }, command = "setl ofu=ccomplete#Complete"})
acmd({"FileType"}, {pattern = { "css" }, command = "setl ofu=csscomplete#CompleteCSS"})

-- functions
function fzfOpen()
end

function clearTrail()
  vim.cmd('s/ *$//g')
  vim.cmd('noh')
end
vim.cmd('command! Trim lua clearTrail()')

-- Abbreviations
vim.cmd(
  [[
    iab {} {<cr>}<esc>O<bs><space>
  ]]
)
acmd( {"BufRead", "BufNewFile"}, {pattern = {"*.c", "*.h"}, command ="iab std. #include<space><stdio.h><cr><cr>int<cr>main(int<space>argc,<space>char<space>*argv[])<cr>{<cr>return<space>0;<cr>}<esc>kO<bs><space>"})
