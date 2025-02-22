return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  enabled = true,
  init = false,
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local logo = [[
              ██████████████████            
           ████                ████         
        ███                        ███      
       █                              █     
     ██                                ██   
     ██                                ██   
    ██                                  ██  
    ██                                  ██  
    ██  ░░░░░░                  ░░░░░░  ██  
    █▒                                  ▒█  
    ██▒                                ▒██  
    ██▒▒▒▒                           ▒▒▒██  
     ██▒▒▒▒▒▒▒▒▒▒▒          ▒▒▒▒▒▒▒▒▒▒▒██   
     ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██   
       █▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█     
        ███▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒███      
          █████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██████        
             ███▒▒▒▒▒▒▒▒▒▒▒▒▒███            
                █████████████               
    ]]
    dashboard.section.buttons.val = {
      dashboard.button("f", "˙ᵕ˙ " .. "               「 ✦  FindA ✦ 」", "<cmd> lua LazyVim.pick()() <cr>"),
      dashboard.button("q", "˙ᵕ˙ " .. "               「 ✦  Leave ✦ 」", ":qa<CR>"),
    }

    dashboard.section.buttons.opts = {
      spacing = 1,
    }

    dashboard.section.header.val = vim.split(logo, "\n")
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.footer.opts.hl = "AlphaFooter"
    return dashboard
  end,
  config = function(_, dashboard)
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        dashboard.section.footer.val = {
          "+",
          " ✞",
          "  ⋆˖⁺‧₊☽◯☾₊‧⁺˖⋆Onu's creator",
          "   𓌹𓆩ཐི‧⁺˚̣̣̣𑁬༺༒︎༻໒˚̣̣̣⁺‧ཋྀ𓆪𓌺 ",
        }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
