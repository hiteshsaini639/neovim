return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format { async = true }
      end, {})
      vim.keymap.set('n', '<leader>i', vim.lsp.buf.implementation, {})
      vim.keymap.set('n', '<leader>r', vim.lsp.buf.references, {})
    end
  }
}


-- |vim.lsp.buf.hover()|
-- |vim.lsp.buf.format()|
-- |vim.lsp.buf.references()|
-- |vim.lsp.buf.implementation()|
-- |vim.lsp.buf.code_action()|
