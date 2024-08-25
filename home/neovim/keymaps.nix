{self, ...}:{
  programs.nixvim = {
    globals.mapleader = " ";
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
  };
            }
