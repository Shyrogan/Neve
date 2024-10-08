{
  plugins = {
    lsp-format = {
      enable = false; # Enable it if you want lsp-format integration for none-ls
    };
    lsp = {
      enable = true;
      capabilities = "offsetEncoding =  'utf-16'";
      servers = {
        clangd = {enable = true;};
        lua-ls = {
          enable = true;
        };
        nil-ls = {enable = true;};
        tsserver = {
          enable = false;
        };
        eslint = {enable = true;};
        pyright = {enable = true;};
        ruff-lsp = {enable = true;};
        typst-lsp = { enable = true; };

        rust-analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
          settings = {
            checkOnSave = true;
            check = {
              command = "clippy";
            };
            # inlayHints = {
            #   enable = true;
            #   showParameterNames = true;
            #   parameterHintsPrefix = "<- ";
            #   otherHintsPrefix = "=> ";
            # };
            procMacro = {
              enable = true;
            };
          };
        };
        svelte = {enable = true;};
        tailwindcss = {
          enable = true;
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = [
                  [ "cva\\(([^)]*)\\)" "[\"'`]([^\"'`]*).*?[\"'`]" ]
                  [ "cx\\(([^)]*)\\)" "(?:'|\"|`)([^']*)(?:'|\"|`)" ]
                  [ "cn\\(([^)]*)\\)" "[\"'`]([^\"'`]*).*?[\"'`]" ]
                  [ "([a-zA-Z0-9\\-:]+)" ]
                ];
              };
            };
          };
        };
      };
      # keymaps = {
      #   silent = true;
      #   lspBuf = {
      #   gd = {
      #     action = "definition";
      #     desc = "Goto Definition";
      #   };
      #   gr = {
      #     action = "references";
      #     desc = "Goto References";
      #   };
      #   gD = {
      #     action = "declaration";
      #     desc = "Goto Declaration";
      #   };
      #   gI = {
      #     action = "implementation";
      #     desc = "Goto Implementation";
      #   };
      #   gT = {
      #     action = "type_definition";
      #     desc = "Type Definition";
      #   };
      #   K = {
      #     action = "hover";
      #     desc = "Hover";
      #   };
      #   "<leader>cw" = {
      #     action = "workspace_symbol";
      #     desc = "Workspace Symbol";
      #   };
      #   "<leader>cr" = {
      #     action = "rename";
      #     desc = "Rename";
      #   };
      # "<leader>ca" = {
      #   action = "code_action";
      #   desc = "Code Action";
      # };
      # "<C-k>" = {
      #   action = "signature_help";
      #   desc = "Signature Help";
      # };
      # };
      # diagnostic = {
      #   "<leader>cd" = {
      #     action = "open_float";
      #     desc = "Line Diagnostics";
      #   };
      #   "[d" = {
      #     action = "goto_next";
      #     desc = "Next Diagnostic";
      #   };
      #   "]d" = {
      #     action = "goto_prev";
      #     desc = "Previous Diagnostic";
      #   };
      #   };
      # };
    };
  };
  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';
}
