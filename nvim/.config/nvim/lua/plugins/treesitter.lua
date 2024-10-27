return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },

      ensure_installed = {
        'vim',
        'vimdoc',
        'regex',
        'tsx',
        'diff',
        'lua',
        'javascript',
        'html',
        'css',
        'typescript',
        'bash',
        'markdown',
        'markdown_inline',
        'yaml',
        'toml',
        'query',
        'json',
        'gitcommit',
        'gitignore',
        'tmux',
      },
    })
  end,
}
