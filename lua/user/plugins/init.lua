-- init
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
  },
  {
    "akinsho/git-conflict.nvim",
    config = function()
      require("git-conflict").setup()
    end
  },
  -- {
  --   "aserowy/tmux.nvim",
  --   config = function()
  --     require("tmux").setup()
  --   end
  -- }
}
-- configs
require("user.plugins.configs.dap")
require("user.plugins.configs.gitsings")
require("user.plugins.configs.treesitter")
require("user.plugins.configs.treesitter")
require("user.plugins.configs.formatter")
