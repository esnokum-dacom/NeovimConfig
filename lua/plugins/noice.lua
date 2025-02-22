return {
  "folke/noice.nvim",
  opts = {
    cmdline = {
      format = {
        cmdline = {
          icon = "☽༺♰༻☾", -- Cambia el icono del CmdLine
          title = "𝕮𝖔𝖒𝖒𝖆𝖓𝖉𝖘", -- Título personalizado
          border = {
            style = "rounded",
            padding = { 2, 2 }, -- Espaciado interno
          },
        },
      },
    },
    highlights = {
      NoiceCmdlinePopupBorder = { fg = "#000000" }, -- Amarillo para el borde
      NoiceCmdlinePopupTitle = { fg = "#FFFFFF", bold = true }, -- Cian para el título
      NoiceCmdlinePopup = { bg = "#100e0d" }, -- Fondo oscuro
    },
  },
}
