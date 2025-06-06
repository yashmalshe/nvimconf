local installs = { 'lua_ls', 'pyright', 'clangd', "superhtml", "cssls", "eslint", "marksman" }

return{
  {
  "williamboman/mason.nvim",
  event = "BufReadPre",
  config = function()
    require("mason").setup()
  end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufReadPre",
    config = function()
      vim.keymap.set('n', "K", vim.lsp.buf.hover, {})
      vim.keymap.set('n', "gd", vim.lsp.buf.definition, {})
      vim.keymap.set('n', "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set('n', "<leader>fm", vim.lsp.buf.format, {})
      require("mason-lspconfig").setup({
        ensure_installed = installs,
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })
          end,
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
  },
}
