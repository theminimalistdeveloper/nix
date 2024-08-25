{ self, ... }: {
  programs.nixvim = {
    # Theme
    colorschemes.catppuccin.enable = true;

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
  };
}
