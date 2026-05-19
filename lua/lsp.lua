require("mason").setup()

local custom_capabilities = vim.lsp.protocol.make_client_capabilities()
custom_capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

vim.lsp.config("*", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(custom_capabilities),
})

vim.lsp.config("ts_ls", {
  root_dir = require("lspconfig.util").root_pattern "tsconfig.json",
  single_file_support = false,
})

vim.lsp.config("denols", {
  root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc"),
})

require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",
    "ts_ls",
    "denols",
    "tailwindcss",
    "perlnavigator",
    "astro",
    "mdx_analyzer",
    "eslint", -- null_lsではなくこっちでて入れEslintFixAllが使えるように
  },
}

-- こっちに寄せる
-- rootにしたい箇所の.null-ls-rootを置く
local null_ls = require "null-ls"
require("null-ls").setup {
  sources = {
    require("none-ls.diagnostics.eslint").with {
      condition = function(utils) return utils.root_has_file { ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" } end,
    },
    require("none-ls.code_actions.eslint").with {
      condition = function(utils) return utils.root_has_file { ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" } end,
    },
    null_ls.builtins.formatting.prettierd.with {
      -- .prettierrc.mjsは未サポート
      condition = function(utils) return utils.root_has_file { ".prettierrc.cjs", ".prettierrc", ".prettierrc.json" } end,
    },
    null_ls.builtins.formatting.stylua,
  },
}

require("mason-null-ls").setup {
  ensure_installed = nil,
  automatic_installation = true,
}
