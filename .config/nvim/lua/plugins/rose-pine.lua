return {
  "rose-pine/neovim",
  name = "rose-pine",
  variant = "moon",
  config = function()
    require("rose-pine").setup({ disable_background = true })
    vim.cmd("colorscheme rose-pine")
  end,
}
