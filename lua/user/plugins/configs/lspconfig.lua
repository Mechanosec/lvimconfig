vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })
require("lvim.lsp.manager").setup("tsserver", {
  init_options = {
    preferences = {
      importModuleSpecifierPreference = "project-relative",
    },
  },

})
