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
lvim.builtin.dap.active = true
local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/.config/lvim/debuggers/vscode-node-debug2/out/src/nodeDebug.js' },
}
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    -- sourceMaps = true,
    protocol = 'inspector',
    -- console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require 'dap.utils'.pick_process,
  },
}
local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
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
lvim.keys.normal_mode["<S-h>"] = ""
lvim.keys.normal_mode["<S-l>"] = ""
lvim.keys.normal_mode["<Tab>"] = "<cmd>BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<S-Tab>"] = "<cmd>BufferLineCyclePrev<cr>"

vim.api.nvim_set_keymap("i", "<C-j>", "<Down>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-k>", "<Up>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-h>", "<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-l>", "<Right>", { noremap = true })

lvim.builtin.which_key.mappings["D"] = {
  name = "+Dap extensions",
  v = { "<cmd>DapVirtualTextToggle<cr>", "Toggle virtual text" }
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
lvim.builtin.which_key.mappings["v"] = {
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
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end
  }
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
