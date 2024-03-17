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

--local terminal = require("nvterm.terminal")
--
--local toggle_modes = {'n', 't'}
--local mappings = {
--  { toggle_modes, '<A-h>', function () terminal.toggle('horizontal') end },
--  { toggle_modes, '<A-v>', function () terminal.toggle('vertical') end },
--  { toggle_modes, '<A-i>', function () terminal.toggle('float') end },
--
--}
--
--local opts = { noremap = true, silent = true }
--
--for _, mapping in ipairs(mappings) do
--  vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
--end
