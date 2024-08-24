{ pkgs, lib, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = "nixos-24.05";
  });
in
{
  imports = [
    nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

      keymaps = [
        # GENERAL COMMANDS
        { key = "<leader>r"; action = "<cmd>w<CR>"; }
        { key = "<leader>qq"; action = "<cmd>qall!<CR>"; }

        # QUICKFIX - $C
        { key = "<leader>cn"; action = "<cmd>cn<CR>"; }
        { key = "<leader>cp"; action = "<cmd>cp<CR>"; }
        { key = "<leader>cc"; action = "<cmd>cclose<CR>"; }

        # CONFIGURATIONS - $N
        { key = "<leader>nh"; action = "<cmd>e ~/nix/home/home.nix<CR>"; }
        { key = "<leader>nn"; action = "<cmd>e ~/nix/home/neovim.nix<CR>"; }
        { key = "<leader>nc"; action = "<cmd>e ~/nix/configuration.nix<CR>"; }

        # WINDOW - $W
        # Increase the size of the current window horizontally
        { action = "<C-w>|"; key = "<leader>wf"; }
        # Increase the size of the current window vertically
        { action = "<C-w>-"; key = "<leader>wfh"; }
        # Create a new window horizontally
        { key = "<leader>ws"; action = "<C-w>s"; }
        # Create a new window vertically
        { key = "<leader>wv"; action="<C-w>v"; }
        # Quit the current window
        { key = "<leader>wq"; action = "<C-w>q";}
        # Zoom current window vertically
        { key =  "<leader>wj"; action = "<C-w>|";}
        # Zoom current window horizontally
        { key = "<leader>wh"; action = "<C-w>_";}
        # Resets the current Zoom
        { key = "<leader>wk"; action = "<C-w>=";}
        # Makes the current window the only one open
        { key = "<leader>wo"; action = "<C-w><C-O>";}

        # move around windows
        { key = "<leader>h"; action = "<C-w>h";}
        { key = "<leader>j"; action = "<C-w>j";}
        { key = "<leader>k"; action = "<C-w>k";}
        { key = "<leader>l"; action = "<C-w>l";}

        # BUFFERS
        # Go to next buffer
        { key = "<leader>bn"; action = "<cmd>bn<cr>";}
        # Go to previous buffer
        { key = "<leader>bp"; action = "<cmd>bp<cr>";}
        # Toggle between last two buffers
        { key = "<leader>bb"; action = "<cmd>b#<cr>";}
        #-- Delete the current buffer
        { key = "<leader>bd"; action = "<cmd>bd<cr>";}
        # List all buffers
        { key = "<leader>bl"; action = "<cmd>ls<cr>";}
        # Delete all buffers
        { key = "<leader>bk"; action = "<cmd>bufdo bd!<cr>";}

        # NEOVIM TREE - $O
        # Neovim Tree toggle in the current directory
        { key = "<leader>o"; action = ":NvimTreeToggle<cr>";}

        # LSP - $L
        #Stop LSP
        { key = "<leader>lo"; action = "<cmd>LspStop<cr>";}
        # Start LSP
        { key = "<leader>la"; action = "<cmd>LspStart<cr>";}
        # Restart LSP
        { key = "<leader>lt"; action = "<cmd>LspRestart<cr>";}
        # Rename the current object under the cursor, this will rename all the occurrences
        { key = "<leader>lr"; action = "<cmd>lua vim.lsp.buf.rename()<cr>";}
        # Jump to object definition
        { key = "<leader>ld"; action = "<cmd>lua vim.lsp.buf.definition()<cr>";}
        # Show the information of the object under the cursor
        { key = "<leader>lh"; action = "<cmd>lua vim.lsp.buf.hover()<cr>";}
        # Jump to implementation
        { key = "<leader>li"; action = "<cmd>lua vim.lsp.buf.implementation()<cr>";}
        # Show signature of the object under the cursor
        { key = "<leader>ls"; action = "<cmd>lua vim.lsp.buf.signature_help()<cr>";}
        # Jump to type definition
        { key = "<leader>lt"; action = "<cmd>lua vim.lsp.buf.type_definition()<cr>";}
        # Show references of the object under the cursor
        { key = "<leader>le"; action = "<cmd>lua vim.lsp.buf.references()<cr>";}
        # Show document symbol list of the current file
        { key = "<leader>lds"; action = "<cmd>lua vim.lsp.buf.document_symbol()<cr>";}
        # Searches for a specific symbol in all the files in the current folder/project
        { key = "<leader>lws"; action = "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>";}
        # Format the current file
        { key = "<leader>lf"; action = "<cmd>lua vim.lsp.buf.format()<cr>";}
        # Jump to the previous diagnostic entry
        { key = "<leader>lp"; action = "<cmd>lua vim.diagnostic.goto_prev({ float = false })<cr>";}
        # Jump to the next diagnostic entry
        { key = "<leader>ln"; action = "<cmd>lua vim.diagnostic.goto_next({ float = false })<cr>";}
];

    # Theme
    colorschemes.tokyonight.enable = true;

    # Settings
    opts = {
      backspace = "indent,eol,start"; # Allow backspace over everything in edit mode
      backup = false;
      clipboard = "unnamedplus";
      colorcolumn = "80"; # Show column markers at column 80 and 100
      cursorline = true; # Highlight cursor line
      expandtab = true; # Convert tab to spaces
      foldcolumn = "1";
      foldexpr = "v:lua.vim.treesitter.foldexpr()";
      foldmethod = "expr"; # Uses the treesitter to determine where to create folds
      foldtext = ""; 
      hidden = true;
      ignorecase = true;
      incsearch = true; # Show search matches as you type
      laststatus = 3; # One status line for Neovim instance instead one per window
      list = true; # Show not visible characters
      listchars = "trail:⋅,space:⋅";
      ls = 0; # Hide unused command line
      number = true; # Set line number
      relativenumber = true; # The count of lines go from the current line instead of the top of the file
      scrolloff = 4; # Set 4 lines on the edge of the screen
      shiftround = false; # Set multiples of shiftwidth when indenting with '<'
      shiftwidth = 2; # Define the number of spaces used for the auto indent
      signcolumn = "yes:1"; # Fix sign column (the column before the numbers) to avoid layout shifting
      smartcase = true; # Use case sensitive when the terms are not all in smallcase
      swapfile = false;
      tabstop = 2; # Set tab to be 2 spaces
      termguicolors = true; # Enables 24-bit RGB color in the |TUI|
      title = true;
      undodir = "~/.undodir";
      undofile = true;
      updatetime = 250;
      virtualedit = "all"; # Let the cursor go anywhere in all modes
      wildmode = "list:longest,full"; # Show a list when pressing tab and complete
      wrap = false; # Dont wrap lines
    };

    # Keymaps
    globals = {
      mapleader = " ";
    };
    
    plugins = {
      lualine.enable = true;
      treesitter.enable = true;
      which-key = {
        enable = true;
      };
      noice = {
        # WARNING: This is considered experimental feature, but provides nice UX
        enable = true;
        presets = {
          bottom_search = true;
          command_palette = true;
          long_message_to_split = true;
          #inc_rename = false;
          #lsp_doc_border = false;
        };
      };
      telescope = {
        enable = true;
        keymaps = {
          "<leader>fl" = {
            options.desc = "Search through the loaded configuration files and reload them";
            action = "reloader";
          };
          "<leader>fgb" = {
            options.desc = "Search through Git branches";
            action = "git_branches";
          };
          "<leader>fgc" = {
            options.desc = "Search through Git commits";
            action = "git_commits";
          };
          "<leader>fb" = {
            options.desc = "Search through open buffers";
            action = "buffers";
          };
          "<leader>ff" = {
            options.desc = "File finder";
            action = "find_files";
          };
          "<leader>fgr" = {
            options.desc = "Find via grep";
            action = "live_grep";
          };
        };
        extensions = {
          file-browser.enable = true;
        };
      };

      # Dev
      lsp = {
        enable = true;
        servers = {
          hls.enable = true;
          marksman.enable = true;
          nil-ls.enable = true;
          rust-analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
        };
      };

    };
  };

}
