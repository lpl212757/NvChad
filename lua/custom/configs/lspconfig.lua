local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- User load_config
local pid = vim.fn.getpid()
local util = require "lspconfig/util"

lspconfig.omnisharp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "C:\\Users\\Admin\\AppData\\Local\\nvim-data\\mason\\packages\\omnisharp\\omnisharp",
    "--languageserver",
    "--hostPID",
    tostring(pid),
  },
  root_dir = util.root_pattern("*.sln", "*.csproj"),
}

lspconfig.pylsp.setup({})
