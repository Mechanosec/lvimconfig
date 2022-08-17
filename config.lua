-- GENERAL
lvim.log.level = "warn"
     lvim.format_on_save = false
lvim.colorscheme = "tokyonight"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
vim.opt.relativenumber = true

-- MAPPINGS
require("user.mappings")
-- PLUGINS
require("user.plugins.init")
