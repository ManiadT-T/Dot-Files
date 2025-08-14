return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false, -- load at startup
  priority = 900, -- load early so it's ready immediately
  config = function()
    local toggleterm = require("toggleterm")

    toggleterm.setup{
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

    -- Start a hidden terminal at launch so it’s ready
    local Terminal = require("toggleterm.terminal").Terminal
    local hidden_term = Terminal:new({ hidden = true })
    hidden_term:spawn() -- launch in background
  end
}

