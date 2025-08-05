return {
  "nvim-telescope/telescope.nvim",
  version = false, -- or tag = '0.1.5' (or the latest tag)
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required dependency
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
  },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "bottom",
        },
        sorting_strategy = "descending",
        winblend = 0,
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })

    -- Optional: load fzf-native if installed
    pcall(require("telescope").load_extension, "fzf")
  end,
}
