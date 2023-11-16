require('plugins')

local cmd = vim.cmd
local fn = vim.fn
local opt = vim.opt
local g = vim.g
local api = vim.api
local keymap = vim.keymap

local utils = require('utils')

-- Vars
-- 
local remap = { remap = true, silent = false }
local noremap = { remap = true, silent = false }

-- Configurations
--

let g:loaded_perl_provider = 0

cmd([[ let extension = expand('%:e') ]])

cmd([[ set bg=dark ]])
cmd([[ set termguicolors ]])
cmd([[ colorscheme tokyonight-moon ]])

cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

g.mapleader = ' '
g.maplocalleader = ','
g.loaded = 1
g.loaded_netrwPlugin = 1
g.netrw_banner = 0

opt.encoding = 'utf-8'
opt.termguicolors = true
opt.shell = 'zsh'
opt.hlsearch = false
opt.updatetime = 300
opt.ttimeoutlen = 0
opt.hidden = true
opt.showcmd = true
opt.smarttab = true
opt.breakindent = true
opt.autoindent = true
opt.smartindent = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.wrap = false
opt.ignorecase = true
opt.expandtab = true
opt.scrolloff = 4
opt.swapfile = true -- enable/disable swap file creation
opt.dir = fn.stdpath("data") .. "/swp" -- swap file directory
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.undodir = fn.expand('~/.config/nvim/nvim-undo')
opt.confirm = true
opt.wildignorecase = true
opt.lazyredraw = true
opt.signcolumn = 'yes'
opt.mouse = 'a'
opt.mousemodel = 'extend'
opt.wildmenu = true
opt.backspace = { 'start', 'eol', 'indent' }
opt.path:append { '**' }
opt.wildignore:append { '*/node_modules/*' }
opt.list = true
opt.listchars:append "space:⋅"
opt.cursorline = true
opt.completeopt = { 'menuone', 'noselect' }
opt.clipboard = 'unnamedplus'
opt.inccommand = 'nosplit'
opt.winblend = 0
opt.wildoptions = 'pum'
opt.pumblend = 5
opt.background = 'dark'
opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }

cmd([[ syntax on ]])
cmd [[ highlight! default link CmpItemKind CmpItemMenuDefault ]]
cmd([[ highlight lCursor guifg=NONE guibg=Cyan ]])
cmd([[ set nu! ]])
cmd([[ set splitbelow splitright ]])
cmd([[ set incsearch ]])
cmd([[ set title ]])
cmd([[ set guicursor= ]])
cmd([[ set t_Co=256 ]])


-- Key Mapping
--

cmd([[ map <C-a> ggVG ]]) -- select all with ctrl+a

keymap.set('n', '<C-s>', ':w<CR>', noremap) -- save on ctrl+s
keymap.set('i', '<C-s>', '<Esc>:w<CR>l', noremap)
keymap.set('v', '<C-s>', '<Esc>:w<CR>', noremap)
keymap.set('i', '<S-Tab>', '<C-d>', noremap) -- shift+tab
keymap.set('n', '<C-q>', ':q!<CR>', noremap) -- quit with ctrl+q
keymap.set('n', '<F4>', ':bd<CR>', noremap) -- F4 close current file
keymap.set('n', '<F6>', ':sp<CR>:terminal<CR>', noremap) -- F6 show terminal
keymap.set('n', 'x', '"_x') -- delete char
keymap.set('x', 'x', '"_x') -- delete visual selection
keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', remap) --toggle file explorer
keymap.set('n', '<space><space>', ':NvimTreeToggle<CR>', remap)

api.nvim_create_augroup('cursorline_focus', {})

api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
    group = 'cursorline_focus',
    callback = function()
        vim.wo.cursorline = true
    end,
})

api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, {
    group = 'cursorline_focus',
    callback = function()
        vim.wo.cursorline = false
    end,
})
