local builtin = require('telescope.builtin')
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

-- Set the leader Key
vim.g.mapleader = " "

-- Python go brr
vim.keymap.set("n", "<leader>ps", ":! source ./env/bin/activate<CR>")

-- Quick move to the explorer
vim.keymap.set("n", "<leader>lk", vim.cmd.Ex)

-- Insert escape
vim.keymap.set("i", "jk", "<Esc>", { noremap = false })

-- Telescope Binds
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope find Git managed files' })
vim.keymap.set('n', '<leader>gf', builtin.live_grep, { desc = 'Telescope live grep' })

-- Harpoon Binds
vim.keymap.set("n", "<leader>hh", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>hr", function() harpoon:list():remove() end)
vim.keymap.set("n", "<leader>hg", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-u>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-i>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-o>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-p>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-J>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-K>", function() harpoon:list():next() end)

-- Visual group move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep things centered
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Non-Destructive Pasting from buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland (yank to and from system clipboard)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Void delete
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

-- Prime says it's bad so I'm not messing with it rn
vim.keymap.set("n", "Q", "<nop>")

-- More centered movements
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Misc (Search and replace, Make executable)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- LSP Binds
vim.keymap.set('n', "<leader>lf", vim.lsp.buf.format)

-- Hover Info
vim.keymap.set('n', 'cc', function() 
  vim.lsp.buf.hover { border = 'rounded', max_height = 25, max_width = 120 } 
end, { desc = "Code Docs" })

-- Check Errors
vim.keymap.set('n', 'ce', function()
  vim.diagnostic.open_float { border = 'rounded', max_height = 25, max_width = 120  }
end, { desc = "Code Errors" })

-- Check Next
vim.keymap.set('n', 'cn', function()
  vim.diagnostic.jump { count = 1, float = true, border = 'rounded', max_height = 25, max_width = 120  }
end, { desc = "Code Errors" })

-- Check Previous
vim.keymap.set('n', 'cb', function()
  vim.diagnostic.jump { count = -1, float = true, border = 'rounded', max_height = 25, max_width = 120  }
end, { desc = "Code Errors" })

-- Add Keys to open splits from Harpoon
harpoon:extend({
  UI_CREATE = function(cx)
    vim.keymap.set("n", "<C-v>", function()
      harpoon.ui:select_menu_item({ vsplit = true })
    end, { buffer = cx.bufnr })

    vim.keymap.set("n", "<C-x>", function()
      harpoon.ui:select_menu_item({ split = true })
    end, { buffer = cx.bufnr })

    vim.keymap.set("n", "<C-t>", function()
      harpoon.ui:select_menu_item({ tabedit = true })
    end, { buffer = cx.bufnr })
  end,
})
