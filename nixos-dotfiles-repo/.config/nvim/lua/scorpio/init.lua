require("scorpio.remap")
require("scorpio.netrw")

vim.opt.undofile = true
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.tabstop = 2           -- Display width of a tab character
vim.opt.shiftwidth = 2        -- Number of spaces for one indent level
vim.opt.softtabstop = 2       -- Backspace deletes this many spaces at a time   

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.g.have_nerd_font = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "120"

vim.o.winborder = 'rounded'
vim.o.autocomplete = true
vim.o.complete = ".,w,b,o"
vim.opt.completeopt = { "menuone", "noselect", "fuzzy" }

-- Remember Fold States
vim.api.nvim_create_autocmd({"BufWinLeave"}, {
  pattern = {"*.*"},
  desc = "save view (folds), when closing file",
  command = "mkview",
})

vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  pattern = {"*.*"},
  desc = "load view (folds), when opening file",
  command = "silent! loadview"
})
