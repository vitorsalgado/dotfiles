local api = require("nvim-tree.api")

api.events.subscribe(api.events.Event.FileCreated, function(file)
  vim.cmd("edit " .. file.fname)
end)

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
    live_filter = {
      prefix = "[FILTER]: ",
      always_show_folders = false, 
    },
  })
