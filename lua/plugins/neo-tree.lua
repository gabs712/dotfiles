return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('neo-tree').setup({
        close_if_last_window = true,
        window = {
          width = 30,
        },
      })

      -- Toggle window, highlight current file, move cursor
      vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle reveal focus left<CR>', {desc = 'Explore tree'})
    end
  }
}
