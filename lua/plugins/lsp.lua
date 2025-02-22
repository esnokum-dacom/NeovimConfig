return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-lenguaje-server",
        "typescript-lenguaje-server",
        "css-lsp",
      })
    end,
  },
}
