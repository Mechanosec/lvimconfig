-- GENERAL
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true

-- PLUGINS CONFIG
-- dap
lvim.builtin.dap = {
  active = true,
}
-- gitsigns
lvim.builtin.gitsigns.opts.current_line_blame = true;
lvim.builtin.gitsigns.opts.current_line_blame_opts = {
  delay = 300
}
-- treesitter
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "html"
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow.enable = true
-- nvvimtree
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.git.ignore = false
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.git = {
  unstaged = "✗",
  staged = "✓",
  unmerged = "",
  renamed = "➜",
  untracked = "★",
  deleted = "",
  ignored = "◌",
}

-- MAPPINGS
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.builtin.which_key.mappings["b"] = {
  name = "+Dap",
  b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Setting breakpoints" },
  l = { "<cmd>lua require'dap'.continue()<cr>", "Launching debug" },
  o = { "<cmd>lua require'dap'.step_over()", "Step over" },
  i = { "<cmd>lua require'dap'.step_into()", "Step into" }
}
lvim.builtin.which_key.mappings["T"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}
lvim.builtin.which_key.mappings["d"] = {
  name = "+Diffview",
  a = { "<cmd>DiffviewFileHistory<cr>", "All" },
  f = { "<cmd>DiffviewFileHistory %<cr>", "Current file" },
  o = { "<cmd>DiffviewOpen<cr>", "Open modified files" },
  c = { "<cmd>DiffviewClose<cr>", "Close modified files" }
}
lvim.builtin.which_key.mappings["s"] = {
  name = "+Spectre",
  c = { "<cmd>lua require('spectre').close()<cr>", "Close" },
  s = { "<cmd>lua require('spectre').open()<cr>", "Search" },
  f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Search in current file" }
}
lvim.builtin.which_key.mappings["t"] = {
  name = "+Telescope",
  f = { "<cmd>Telescope find_files<cr>", "File" },
  g = { "<cmd>Telescope live_grep<cr>", "Grep" },
  b = { "<cmd>Telescope buffers<cr>", "Buffers" },
  h = { "<cmd>Telescope help_tags<cr>", "Help tags" }
}
lvim.builtin.which_key.mappings["."] = {
  name = "+Terminal",
  c = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
  v = { "<cmd>ToggleTerm direction=vertical<cr>", "Vertical" },
  h = { "<cmd>ToggleTerm direction=horizontal<cr>", "Horizontal" }
}

-- PLUGINS
lvim.plugins = {
  { "folke/tokyonight.nvim" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "p00f/nvim-ts-rainbow",
  },
  {
    "tpope/vim-surround",
  },
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({
        trigger_events = { "InsertLeave" }
      })
    end,
  },
}

-- FORMATTER
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "javascript", "typescript", "typescriptreact" },
  },
}
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint",
    filetypes = { "javascript", "typescript", "typescriptreact" }
  }
}
