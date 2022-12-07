--require('nvim-autopairs').setup({
--  enable_check_bracket_line = false
--})
--require'nvim-web-devicons'.get_icons()
require('impatient')


local gps = require("nvim-gps").setup()
-- Lua

local components = {
  active = {},
  inative = {}
}
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inative, {})
table.insert(components.inative, {})

table.insert(components.active[5], {
    provider = 'texaqui'
})
provider = {
    name = 'my_provider',
    opts = {
        type = 'unique',
        file_modified_icon = 'M'
    }
}



--require('feline').setup({
  -- table.insert(components.active[2],{
  --   provider = {
  --     name = 'file_info',
  --     opts = {
  --       type = 'unique',
  --       file_modified_icon = 'M'
  --     },
  --   }
  -- }),
  -- table.insert(components.active[3],{ 
  --   provider = {
  --      'abobora',
  --   }
  -- }
  --  
  -- ) 
--})

--local components = require('feline.presets')[meu]
--require('feline').setup({})

--require('feline').add_preset('meu.lua', plugins.meu)
--local cmd = vim.cmd-require('feline').use_preset('meu')
--local utils = require("plugins")
--local plugin = plugins
-- require("lualine", function(lualine) -- {{{
--   local opts = require("plugins.lualine-theme").get_theme({ theme = Theme.theme[2] })
--   lualine.setup(opts)
-- end) -- }}}
--require('lualine').get_config{(require('plugins.linetheme'))}
-- Lua

-- require("nvim-gps").setup()
-- local gps = require("nvim-gps")
-- require("lualine").setup({
-- options = { theme = 'onedark' },
-- 	sections = {
-- 			lualine_c = {
-- 				{ gps.get_location },
-- 			}
-- 	}
-- })

require('lualine').setup()
--  options = { theme = require('plugins.gruv') }
--   sections = { lualine_c = { 'progress' }}
--}


require("bufferline").setup{}


vim.o.completeopt = "menuone,noselect"
require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp_signature_help' },
  }
}
require("nvim-lsp-installer").setup({
    ensure_installed = { "rust_analyzer", "sumneko_lua" }, -- ensure these servers are always installed
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗"
      }
    }
  })

local lsp_status = require('lsp-status')
lsp_status.register_progress()

local lspconfig = require('lspconfig')

--local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
local signs = { Error = "✗", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Some arbitrary servers
lspconfig.clangd.setup({
--    handlers = lsp_status.extensions.cla/ngd.setup(),
    init_options = {
      clangdFileStatus = true
    },
    on_attach = lsp_status.on_attach,
    capabilities = lsp_status.capabilities
  })

--lspconfig.pyls_ms.setup({
--    handlers = lsp_status.extensions.pyls_ms.setup(),
--    settings = { python = { workspaceSymbols = { enabled = true }}},
--    on_attach = lsp_status.on_attach,
--    capabilities = lsp_status.capabilities
--  })

lspconfig.ghcide.setup({
    on_attach = lsp_status.on_attach,
    capabilities = lsp_status.capabilities
  })
lspconfig.rust_analyzer.setup({
    on_attach = lsp_status.on_attach,
    capabilities = lsp_status.capabilities
  })

--require'html'.setup()
--lspconfig.html.setup({
--   capabilities = lsp_status.capabilities
--})

--require'lspconfig'.cssls.setup {
--  cmd = { "vscode-css-language-server.cmd", "--stdio" },
--  capabilities = capabilities,
--}
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}


 local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
--    cmd = { "vscode-html-language-server.cmd", "--stdio" },
    capabilities = capabilities,
  }

require('lspconfig').jsonls.setup{
capabilities = capabilities,

}
--require'lspconfig'.stylelint_lsp.setup({})
--lspconfig.tsserver.setup({})
--require'lspconfig'.html.setup({ capabilities = lsp_status.capabilities})
lspconfig.emmet_ls.setup({ capabilities = capabilities})
--require'lspconfig'jsonls.setup{}
--lspconfig.jsonls.setup( capabilities = capabilities)
--lspconfig.jsonls.setup({ capabilities = lsp_status.capabilities})
require('nvim-autopairs').setup{}

require'nvim-treesitter.configs'.setup {
  capabilities = capabilities
}

require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }

--require'neoclide/coc.nvim'
--require'lspconfig'.sumneko_lua.setup{
--  capabilities = capabilities,
--  on_atach = on_atach,
--    settings ={
--      Lua = {
--    diagnostics = {
--      globals = {'use', 'vim'},
--      workspace = {
--        library = vim.api.nvim_get_runtime_file(" ", true),
--        checkThirdParty = false
--      },
--    },
--  },
--},
--}

require('lspconfig').sumneko_lua.setup{}
--  nvim_lsp.sumneko_lua.setup{
--  on_attach = on_attach,
--  settings = {
--    Lua = {
--      diagnostics = {
--        globals = {
--          'vim'
--        },
--      },
--      workspace = {
--        library = vim.api.nvim_get_runtime_file("", true),
--        checkThirdParty = false
--      },
--    },
--  },
--}

require'lspconfig'.tsserver.setup{
  filetypes = {'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact'},
  capabilities = capabilities,
}

require'lspconfig'.tailwindcss.setup{
  -- filetypes = {'javascript', 'javascriptreact', 'css', 'scss', 'html', 'typescript', 'typescriptreact' },
filetypes =  { "aspnetcorerazor", "astro", "astro-markdown", "blade", "django-html", "htmldjango", "edge", "eelixir", "ejs", "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte" },

  {
  tailwindCSS = {
    classAttributes = { "class", "className", "classList", "ngClass" },
--    lint = {
--      cssConflict = "warning",
--      invalidApply = "error",
--      invalidConfigPath = "error",
--      invalidScreen = "error",
--      invalidTailwindDirective = "error",
--      invalidVariant = "error",
--      recommendedVariantOrder = "warning"
--    },
--    validate = true
  }
}
}



require'lspconfig'.eslint.setup{
filetypes = { "css", "html",  "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue" } ,
plugins = {
        "html"},
capabilities = capabilities,
}

--require'lspconfig'.eslint.setup{
--local null_ls = require("null-ls")
--local eslint = require("eslint")
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.completion.spell,
    },
})


require'lspconfig'.intelephense.setup{
capabilities = capabilities}



require("nvim-web-devicons").set_icon {
  js = {
    icon = "",
    color = "#f7df1e",
    name = "Js"
    },
  html = {
    icon = "",
    color = "#f06529",
    name = "Html"
  },
  css = {
    icon = "",
    color = "#2965f1",
    name = "Css"
  },
  md = {
    icon = "",
    color = "#005b96",
    name = "Md"
  },
}




-- eslint??  
-- local null_ls = require("null-ls")
-- null_ls.setup({
--     sources = {
--             null_ls.builtins.diagnostics.eslint, -- eslint or eslint_d
--                     null_ls.builtins.code_actions.eslint, -- eslint or eslint_d
--                             null_ls.builtins.formatting.prettier -- prettier, eslint, eslint_d, or prettierd
--                                 },
--                                 })
--
--
--                                 local null_ls = require("null-ls")
--                                 null_ls.setup({
--                                     sources = {
--                                             null_ls.builtins.diagnostics.eslint.with({
--                                                         only_local = "node_modules/.bin",
--                                                                 }),
--                                                                     },
--au BufWritePost lua require('lint').try_lint()
--                                                                     })
-- require('lint').linters_by_ft = {
-- --    markdown = {'vale',},
--     hmtl = {'tidy'},
--   }
-- --vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- vim.api.nvim_create_autocmd({ "InsertLeave" }, {
--     callback = function()
--           require("C:/ProgramData/chocolatey/lib/html-tidy/tools/tidy-5.9.14-win64/tidy.exe").try_lint()
--             end,
--           })
