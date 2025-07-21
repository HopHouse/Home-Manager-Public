return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- add tokyonight
  {
   "folke/tokyonight.nvim",
  },

  -- add catpucin
  {
   "catppuccin/nvim",
  },

  -- add Kanagwa
  {
    "rebelot/kanagawa.nvim",
  },
 
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-dragon",
    },
  }
}
