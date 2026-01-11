-- install varnishls first
return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      varnishls = {
        cmd = { "varnishls", "lsp", "--stdio" },
        filetypes = { "vcl", "vtc" },
        root_markers = { ".varnishls.toml", ".git" },
        settings = {},
      },
    },
  },
}

