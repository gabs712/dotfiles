return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = 'nvim-treesitter/nvim-treesitter-textobjects',
  priority = 1000,
  build = ":TSUpdate",
  config = function () 
    require("nvim-treesitter.configs").setup({
      ensure_installed = { 'lua', 'javascript', 'html', 'css', 'typescript' },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },

      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Jump to next ocurrence if not inside any

          keymaps = {
            ["if"] = { query = "@function.inner", desc = "Select inside function" },
            ["af"] = { query = "@function.outer", desc = "Select around function" },
            ["ic"] = { query = "@class.inner", desc = "Select inside class" },
          },
        }
      }
    })
  end
}

