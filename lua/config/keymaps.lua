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
  local filename = vim.fn.fnamemodify(file, ":r")

  local cmd = ""
  if filetype == "typescript" or filetype == "javascript" then
    cmd = "ts-node " .. file
  elseif filetype == "lua" then
    cmd = "lua " .. file
  elseif filetype == "python" then
    cmd = "python " .. file
  elseif filetype == "c" then
    cmd = "chcp 65001 > nul && gcc " .. file .. " -o " .. filename .. ".exe && " .. filename .. ".exe"
  else
    vim.notify("No hay un intérprete definido para " .. filetype, vim.log.levels.WARN)
    return
  end

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.5)
  local row = math.floor((vim.o.lines - height) / 1.2)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  vim.cmd("highlight NormalFloat guibg=NONE ctermbg=NONE")

  vim.fn.termopen(cmd)

  keymap.set("n", "<Esc>", "<C-\\><C-n>:close<CR>", { noremap = true, silent = true })
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
