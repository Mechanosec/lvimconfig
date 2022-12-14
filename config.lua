-- GENERAL
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
vim.opt.relativenumber = true

-- MAPPINGS
require("user.mappings")
-- PLUGINS
require("user.plugins.init")
