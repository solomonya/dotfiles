local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local profile = require("personal").profile

local imports = {
	{ import = "personal.plugins" },
	{ import = "personal.plugins.lsp" },
}

if profile == "ts" then
	table.insert(imports, { import = "personal.plugins.profiles.ts" })
elseif profile == "clj" then
	table.insert(imports, { import = "personal.plugins.profiles.clj" })
elseif profile == "py" then
	table.insert(imports, { import = "personal.plugins.profiles.py" })
end

require("lazy").setup(imports, {
	enabled = true,
	notify = false,
})

