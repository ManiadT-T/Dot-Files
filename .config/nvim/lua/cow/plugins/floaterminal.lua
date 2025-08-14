return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = { { "<leader>t", mode = { "n", "t" } } }, -- lazy-load on first <leader>t press
  config = function()
    require("toggleterm").setup{
      open_mapping = [[<leader>t]],
      direction = "float",
      persist_size = true,
      persist_mode = true,
      float_opts = {
        border = "rounded",
        width = math.floor(vim.o.columns * 0.8),
        height = math.floor(vim.o.lines * 0.8),
        winblend = 10,
      }
    }
  end
}
