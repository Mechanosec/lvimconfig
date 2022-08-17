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

lvim.builtin.which_key.mappings["r"] = {
  function()
    vim.cmd("e!")
    vim.cmd("NvimTreeRefresh")
  end,
  "Refresh Buffer"
}
lvim.builtin.which_key.mappings["o"] = {
  "<cmd>SymbolsOutline<cr>", "+SymbolsOutline"
}
lvim.builtin.which_key.mappings["g"]["l"] = { "<cmd>lua require('git.blame').blame()<cr>", "Blame" }
-- lvim.builtin.which_key.mappings["T"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }
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
lvim.builtin.which_key.vmappings["w"] = { "<esc>:lua require('spectre').open_visual()<CR>", "Search" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Telescope",
  f = { "<cmd>Telescope find_files<cr>", "File" },
  g = { "<cmd>Telescope live_grep<cr>", "Grep" },
  b = { "<cmd>Telescope buffers<cr>", "Buffers" },
  h = { "<cmd>Telescope help_tags<cr>", "Help tags" }
}
lvim.builtin.which_key.mappings["."] = {
  name = "+Terminal",
  f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
  v = { "<cmd>ToggleTerm direction=vertical<cr>", "Vertical" },
  h = { "<cmd>ToggleTerm direction=horizontal<cr>", "Horizontal" }
}
lvim.builtin.which_key.mappings["D"] = {
  name = "+Dap extensions",
  v = { "<cmd>DapVirtualTextToggle<cr>", "Toggle virtual text" },
  u = { "<cmd>lua require('dapui').toggle({reset=true})<cr>", "Toogle UI" },
  -- o = { "<cmd>lua require('dapui').open()", "Open UI" },
  -- c = { "<cmd>lua require('dapui')", "Close UI" },
}
lvim.builtin.which_key.mappings["d"] = {
  name = "+Telescope",
  f = { "<cmd>Telescope find_files<cr>", "File" },
  g = { "<cmd>Telescope live_grep<cr>", "Grep" },
  b = { "<cmd>Telescope buffers<cr>", "Buffers" },
  h = { "<cmd>Telescope help_tags<cr>", "Help tags" }
}
