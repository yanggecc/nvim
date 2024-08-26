require "nvchad.options"
require("core.lsp")

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local opt = vim.opt
local lsp = vim.lsp

-- 系统剪切板
opt.clipboard:append("unnamedplus")
-- 开启类型高亮
lsp.inlay_hint.enable(true)


-- vim.cmd([[ au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]])
-- neovideo 配置
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.print(vim.g.neovide_version)
  vim.o.guifont = "Source Code Pro:h10"
end
-- fcitx5 config
-- 1、退出插入模式时禁用输入法，并保存状态
-- 2、表示之前状态打开了输入法，则进入插入模式时启动输入法
vim.cmd([[
  let fcitx5state=system("fcitx5-remote")
  autocmd InsertLeave * :silent let fcitx5state=system("fcitx5-remote")[0] | silent !fcitx5-remote -c
  autocmd InsertEnter * :silent if fcitx5state == 2 | call system("fcitx5-remote -o") | endif
" au BufWrite * :Autoformat
]])

