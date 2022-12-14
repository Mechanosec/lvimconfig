-- init
lvim.plugins = {
  -- Colorshemes
  { "folke/tokyonight.nvim" },
  { "EdenEast/nightfox.nvim" },
  -- Other
  {
    "mg979/vim-visual-multi"
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
        trigger_events = { "InsertLeave" },
        debounce_delay = 500
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
      require("user.plugins.configs.dapui")
    end
  },
  {
    "akinsho/git-conflict.nvim",
    config = function()
      require("git-conflict").setup()
    end
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    config = function()
      require("symbols-outline").setup()
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  },
  {
    "dinhhuy258/git.nvim",
    config = function()
      require('git').setup({})
    end
  },
}
-- configs
lvim.builtin.alpha.active = false
require("user.plugins.configs.bufferline")
require("user.plugins.configs.dap")
require("user.plugins.configs.gitsings")
require("user.plugins.configs.treesitter")
require("user.plugins.configs.nvimtree")
require("user.plugins.configs.formatter")
require("user.plugins.configs.lspconfig")
