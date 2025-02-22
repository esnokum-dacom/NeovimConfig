local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Select All
keymap.set("n", "<C-a>", "gg<S-s>G")

--Buffers
keymap.set("n", "<Tab>", ":bNext<Return>")

--Experiements
vim.keymap.set("n", "<C-r>", function()
  local file = vim.fn.expand("%") -- Obtiene el archivo actual
  local filetype = vim.bo.filetype -- Obtiene el tipo de archivo actual

  if filetype == "typescript" or filetype == "javascript" then
    vim.cmd("split | terminal ts-node " .. file)
  elseif filetype == "lua" then
    vim.cmd("split | terminal lua " .. file)
  elseif filetype == "python" then
    vim.cmd("split | terminal python " .. file)
  elseif filetype == "cs" then
    vim.cmd("split | terminal dotnet run")
  else
    vim.notify("No hay un intérprete definido para " .. filetype, vim.log.levels.WARN)
  end
end, { noremap = true, silent = true })

--Split Windows
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

--Move Windows
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sj", "<C-w>k")
keymap.set("n", "sk", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

--Rezise Windows
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><rigth>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")
