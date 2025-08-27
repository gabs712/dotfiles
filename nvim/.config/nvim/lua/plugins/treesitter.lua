return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('nvim-treesitter.configs').setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },

      ensure_installed = {
        'vim',
        'vimdoc',
        'regex',
        'diff',
        'tmux',
        'lua',
        'javascript',
        'tsx',
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
        'jsonc',
        'gitcommit',
        'gitignore',
        'git_config',
        'sql',
        'prisma',
      },
    })
  end,
}
