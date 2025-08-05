return {
  "lervag/vimtex",
  lazy = false, -- vimtex needs to be loaded immediately
  config = function()
    -- You can customize vimtex behavior here
    vim.g.vimtex_view_method = 'zathura' -- or 'skim', 'sioyek', 'mupdf', etc.
    vim.g.vimtex_compiler_method = 'tectonic'

    -- Optional: use quickfix window
    vim.g.vimtex_quickfix_mode = 0
    vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>", { desc = "Compile LaTeX" })
    vim.keymap.set("n", "<leader>lk", "<cmd>VimtexStop<CR>", { desc = "Stop Compilation" })
    vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>", { desc = "Open PDF Viewer" })
    vim.keymap.set("n", "<leader>lc", "<cmd>VimtexClean<CR>", { desc = "Clean Aux Files" })
    vim.keymap.set("n", "<leader>lC", "<cmd>VimtexClean!<CR>", { desc = "Full Clean" })
    vim.keymap.set("n", "<leader>lt", "<cmd>VimtexTocToggle<CR>", { desc = "Toggle TOC" })
  end,
  ft = { "tex", "plaintex", "latex" },
}
