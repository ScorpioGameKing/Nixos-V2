return {
    {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.enable({
                "basedpyright", 
                "lua_ls",
                "bashls",
                "gopls"
            })
    end
    }
}
