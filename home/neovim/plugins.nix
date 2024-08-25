{self, ...}: {
  programs.nixvim.plugins = {
    comment.enable = true;
    emmet.enable = true;
    luasnip.enable = true;
    markdown-preview.enable = true;
    nvim-colorizer.enable = true;
    nvim-tree.enable = true;
    treesitter-context.enable = true;
    treesitter.enable = true;
    surround.enable = true;
    tmux-navigator.enable = true;
    which-key.enable = true;
    neotest.enable = true;
    neogit.enable = true;
    noice = {
      enable = true;
      presets = {
        bottom_search = true;
        command_palette = true;
        long_message_to_split = true;
      };
    };
    telescope = {
      enable = true;
      extensions = {
        file-browser.enable = true;
      };
    };

    # LUALINE
    lualine = {
      enable = true;
      theme = {
        normal = {
          a = { fg = "#000000"; bg = "#ca9ee6"; };
          b = { fg = "#000000"; bg = "#85c1dc"; };
          c = { fg = "#ffffff"; bg = ""; };
          x = { fg = "#ffffff"; bg = ""; };
          z = { fg = "#ffffff"; bg = ""; };
        };
        insert = {
          a = { fg = "#000000"; bg = "#e78284"; };
          z = { fg = ""; bg = ""; };
        };
        visual = {
          a = { fg = ""; bg = "#a6d189"; };
          z = { fg = "#ffffff"; bg = "#000000"; };
        };
        replace = {
          a = { fg = "#000000"; bg = "#8caaee"; };
          z = { fg = "#ffffff"; bg = "#000000"; };
        };
        inactive = {
          a = { fg = "#ffffff"; bg = ""; };
          b = { fg = "#ffffff"; bg = ""; };
          c = { fg = "#ffffff"; bg = ""; };
        };
      };
      componentSeparators = {
          left = "";
          right = "";
        };
        sectionSeparators = {
          left = "";
          right = "";
        };
        inactiveSections = {
          lualine_a = null;
          lualine_b = null;
          lualine_c = null;
          lualine_x = null;
          lualine_y = null;
          lualine_z = null;
        };
        sections = {
          lualine_a = [ "mode" ];
          lualine_b = [ "branch" ];
          lualine_c = [ "filename" "filesize" "diff"];
          lualine_x = [ "diagnostics" ];
          lualine_y = [  ];
          lualine_z = [ "filetype" "encoding" "fileformat" "progress" "location" ];
        };
      };

# CMP
    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp-cmdline.enable = true;
    lspkind.enable = true;
    cmp = {
      enable = true;

      settings = {
        autoEnableSources = true;
        experimental = {ghost_text = true;};
        window = {
          completion.border = "solid";
          documentation.border = "solid";
        };

        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };

        sources = [
        {
          name = "luasnip";
          keywordLength = 3;
        }
        {name = "nvim_lsp";}
        {name = "buffer";}
        {name = "path";}
        ];

        mapping = {
          "<S-J>" = "cmp.mapping.select_next_item({ select = true})";
          "<S-K>" = "cmp.mapping.select_prev_item({ select = true})";
          "<CR>" = "cmp.mapping.confirm({ select = true})";
        };
      };
    };

# LSP
    lsp = {
      enable = true;
      servers = {
        tsserver.enable = true;
        hls.enable = true;
        marksman.enable = true;
        nil-ls.enable = true;
        html.enable = true;
        lua-ls.enable = true;
        jsonls.enable = true;
        rust-analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };
      };
    };
  };
}
