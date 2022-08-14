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
