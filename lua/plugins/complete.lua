-- if extension == "md" then
--   require("plugins.tabnine")setup{
--     sources = {
--       name = 'cpm_tabnine'
--     }
--   }
--
-- else
--
  require("plugins.lsp")
-- end

--  require("plugins.lsp")
--local lsp_status = require('lsp-status')
-- completion_customize_lsp_label as used in completion-nvim
-- Optional: customize the kind labels used in identifying the current function.
-- g:completion_customize_lsp_label --is a dict mapping from LSP symbol kind 
-- to the string you want to display as a label
--lsp_status.config { kind_labels = vim.g.completion_customize_lsp_label }

-- Register the progress handler
--lsp_status.register_progress()
 -- require'cmp'.setup{
 --   sources = {
 --     name = 'cpm_tabnine'
 --   }
 -- }
