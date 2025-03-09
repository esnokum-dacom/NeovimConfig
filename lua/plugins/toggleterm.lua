return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return math.floor(vim.o.columns * 0.4)
          end
        end,
        open_mapping = [[<C-d>]],
        direction = "float", -- Puede ser "horizontal", "vertical", "tab" o "float"
        close_on_exit = false, -- Cerrar la terminal cuando el proceso termine
        shell = "C:/Users/esnok/AppData/Local/Microsoft/WindowsApps/pwsh.exe",
        float_opts = {
          border = "rounded", -- Bordes: "single", "double", "rounded", "shadow"
          winblend = 3, -- Transparencia (0-100)
        },
      })
      vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>:ToggleTerm<CR>]], { noremap = true, silent = true })
    end,
  },
}
