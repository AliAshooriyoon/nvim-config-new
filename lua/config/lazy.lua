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

-- Set proxy environment variables
vim.env.http_proxy = "http://127.0.0.1:2080"
vim.env.https_proxy = "http://127.0.0.1:2080"

require("lazy").setup({
  spec = {
    -- Add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins", opts = {
      colorscheme = "solarized-osaka",
    } },
    -- Import/override with your plugins
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.lang.json" },
    -- Add Telescope.nvim and its dependency
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
    { import = "plugins" },
    -- Add Comment.nvim
    {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end,
    },
    -- Add Lorem Ipsum plugin
    {
      "derektata/lorem.nvim",
      config = function()
        -- Key mapping for inserting Lorem Ipsum
        vim.keymap.set("n", "<leader>li", ":Lorem<CR>", { desc = "Insert Lorem Ipsum" })
      end,
    },
    -- Add GitHub Copilot plugin (Ensure no conflict)
    {
      "github/copilot.vim",
      config = function()
        vim.env.http_proxy = "http://127.0.0.1:2080" -- Replace with your proxy
        vim.env.https_proxy = "http://127.0.0.1:2080" -- Replace with your proxy
        -- Enable GitHub Copilot
        vim.g.copilot_enabled = 1
      end,
    },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
