require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  ensure_installed = { "json", "http", "help", "typescript", "javascript", "python", "go", "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  },

  -- Uses Vim's built-in syntax highlighting AND treesitter, slows down editor so no thanks.
  additional_vim_regex_highlighting = false,
}
