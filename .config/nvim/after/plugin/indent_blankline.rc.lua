vim.cmd([[ highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine ]])
vim.cmd([[ highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine ]])

require("indent_blankline").setup {
  char = "",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
  space_char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
  show_trailing_blankline_indent = false,
}

vim.cmd([[ inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>" ]])
