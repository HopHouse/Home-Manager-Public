return {
  -- NvTerm
  {
    "NvChad/nvterm",
    config = function ()
      require("nvterm").setup()
    end,
    keys = {
      { "<A-h>", mode = { "n", "t" }, function () require("nvterm.terminal").toggle('horizontal') end, desc="" },
      { "<A-v>", mode = { "n", "t" }, function () require("nvterm.terminal").toggle('vertical') end, desc="" },  
      { "<A-i>", mode = { "n", "t" }, function () require("nvterm.terminal").toggle('float') end, desc="" },
    },
  }
}
