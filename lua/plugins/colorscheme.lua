return {
  "mcchrish/zenbones.nvim",
  dependencies = { "rktjmp/lush.nvim" },
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.zenbones = { darkness = "stark", transparent_background = true }
    vim.cmd.colorscheme("zenbones")
    vim.cmd([[hi Normal guibg=NONE ctermbg=NONE guifg=#ffffff gui=bold]])
    vim.cmd([[hi NormalNC guibg=NONE ctermbg=NONE guifg=#cccccc gui=bold]])
    vim.cmd([[hi EndOfBuffer guibg=NONE ctermbg=NONE guifg=#666666]])
    vim.cmd([[hi Statement guifg=#ffffff ctermfg=220 gui=bold]])
    vim.cmd([[hi Type guifg=#7c7c7c ctermfg=51 gui=bold]])
    vim.cmd([[hi Identifier guifg=#f0f0f0 ctermfg=198 gui=bold]])
  end,
}
