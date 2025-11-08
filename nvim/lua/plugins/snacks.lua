return {
{
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below

    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
	keys = {
      { "<A-w>", function() require("snacks").bufdelete() end, desc = "[Snacks] Delete buffer" },
      { "<leader>ggb", function() require("snacks").git.blame_line() end, desc = "[Snacks] Git blame line" },
      { "<leader>ggB", function() require("snacks").gitbrowse() end, desc = "[Snacks] Git browse" },
	},
},
}
