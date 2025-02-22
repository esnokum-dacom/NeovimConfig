require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = {
      normal = {
        a = { fg = "#000000", bg = "#e6f0ff", gui = "bold" }, -- Color para la sección A
        b = { fg = "#000000", bg = "#e9e5ef" }, -- Color para la sección B
        c = { fg = "#ffffff", bg = "NONE" }, -- Fondo transparente en el centro
      },
      insert = { a = { fg = "#0b0714", bg = "#e6f0ff", gui = "bold" } },
      visual = { a = { fg = "#000000", bg = "#e9e5ef", gui = "bold" } },
      replace = { a = { fg = "#000000", bg = "#e6f0ff", gui = "bold" } },
      command = { a = { fg = "#000000", bg = "#e9e5ef", gui = "bold" } },
      inactive = {
        a = { fg = "#666666", bg = "#e9e5ef" },
        b = { fg = "#666666", bg = "#e9e5ef" },
        c = { fg = "#666666", bg = "#e6f0ff" },
      },
    },
    section_separators = { left = "░", right = " ░" },
    component_separators = { left = "░", right = " ░" },
  },
  sections = {
    lualine_a = { { "mode", icon = "♰" } },
    lualine_b = { "filename" },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        function()
          return "´ཀ`" .. os.date("%H-%M")
        end,
        color = { fg = "#1b1b1b", gui = "bold" },
      },
    },
  },
})
