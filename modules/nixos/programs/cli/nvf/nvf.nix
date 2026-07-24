{ ... }: {
  programs.nvf = {
    enable = true;
    settings.vim = {
      viAlias = true;
      vimAlias = true;

      theme = {
        enable = true;
        name = "gruvbox";
        style = "dark";
      };

      options = {
        tabstop = 2;
        shiftwidth = 2;
        wrap = false;
      };

      undoFile.enable = true;
      statusline.lualine.enable = true;
      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;
      binds.cheatsheet.enable = true;
      minimap.minimap-vim.enable = true;
      formatter.conform-nvim.enable = true;

      debugger = {
        nvim-dap.enable = true;
        nvim-dap.ui.enable = true;
      };

      keymaps = [

        # Quick Open keymaps
        {
          key = "<leader>km";
          mode = "n";
          silent = true;
          action = "<cmd>Telescope keymaps<CR>";
        }

        # Toggle Undotree
        {
          key = "<leader>u";
          mode = "n";
          silent = true;
          action = "<cmd>UndotreeToggle<CR>";
        }

        # Toggle Minimap
        {
          key = "<leader>mm";
          mode = "n";
          silent = true;
          action = "<cmd>MinimapToggle<CR>";
        }

        # Clear Highlights
        {
          key = "<leader>ch";
          mode = "n";
          silent = true;
          action = "<cmd>noh<CR>";
        }

        # Better Search & Replace
        {
          key = "<leader>s";
          mode = "n";
          silent = true;
          action = "[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]";
        }

        # Make Shell Script Executable
        {
          key = "<leader>x";
          mode = "n";
          silent = true;
          action = "<cmd>!chmod +x %<CR>";
        }

        # Keep things centered while moving x4
        {
          key = "<C-d>";
          mode = "n";
          silent = true;
          action = "<C-d>zz";
        }

        {
          key = "<C-u>";
          mode = "n";
          silent = true;
          action = "<C-u>zz";
        }

        {
          key = "n";
          mode = "n";
          silent = true;
          action = "nzzzv";
        }

        {
          key = "N";
          mode = "n";
          silent = true;
          action = "Nzzzv";
        }

        # Visual Group Down
        {
          key = "J";
          mode = "v";
          silent = true;
          action = ":m '>+1<CR>gv=gv";
        }

        # Visual Group Up
        {
          key = "K";
          mode = "v";
          silent = true;
          action = ":m '<-2<CR>gv=gv";
        }

        # Quick Escape
        {
          key = "jk";
          mode = "i";
          silent = true;
          action = "<Esc>";
        }

      ];

      autocmds = [

        {
          event = [ "BufWinLeave" ];
          pattern = [ "*.*" ];
          desc = "Save view when closing";
          command = "mkview";
        }

        {
          event = [ "BufWinEnter" ];
          pattern = [ "*.*" ];
          desc = "Load view when opening";
          command = "silent! loadview";
        }

      ];

      lsp = {
        enable = true;
        servers.nil.settings.nil.nix.autoArchive = true;
      };

      languages = {
        enableTreesitter = true;
        enableFormat = true;
        bash.enable = true;
        lua.enable = true;
        markdown.enable = true;
        nix.enable = true;
        python.enable = true;
        toml.enable = true;
        json.enable = true;
        qml.enable = true;
        yaml.enable = true;
      };

      treesitter = {
        enable = true;
        fold = true;
      };

      terminal = {
        toggleterm = {
          enable = true;
          lazygit.enable = true;
          setupOpts = {
            direction = "float";
          };
        };
      };

      utility = {
        smart-splits.enable = true;
        undotree.enable = true;
        nix-develop.enable = true;
        yazi-nvim = {
          enable = true;
          mappings = {
            openYaziDir = "<leader>lk";
          };
        };
      };

      luaConfigPost = ''
        vim.hlsearch = false
        vim.incsearch = true
        vim.opt.scrolloff = 8
        vim.opt.isfname:append("@-@")
        vim.opt.winborder = 'rounded'
      '';
    };
  };
}
