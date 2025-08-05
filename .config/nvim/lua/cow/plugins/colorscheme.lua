        return {
      -- Add your desired colorscheme plugin
      { "neanias/everforest-nvim" }, -- Example: Gruvbox colorscheme
      -- Configure LazyVim to use the colorscheme
      {
        "LazyVim/LazyVim",
        opts = {
          colorscheme = "everforest", -- Replace "gruvbox" with your chosen colorscheme name
        },
      },
    }
