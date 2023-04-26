require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  ensure_installed = { "json", "http", "html", "css", "typescript", "javascript", "python", "go", "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  },

  indent = {
    enable = true
  },

  autotag = {
    enable = true,
    filetypes = { 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript' }
  },

  rainbow = {
    enable = true,
    -- list of languages you want to disable the plugin for
    disable = { "jsx", "cpp" },
    -- Which query to use for finding delimiters
    query = 'rainbow-parens',
    strategy = require("ts-rainbow").strategy.global,
    hlgroups = {
      'TSRainbowRed',
      'TSRainbowYellow',
      'TSRainbowBlue',
      'TSRainbowOrange',
      'TSRainbowGreen',
      'TSRainbowViolet',
      'TSRainbowCyan'
    },

  },

  -- Uses Vim's built-in syntax highlighting AND treesitter, slows down editor so no thanks.
  additional_vim_regex_highlighting = false,
}
