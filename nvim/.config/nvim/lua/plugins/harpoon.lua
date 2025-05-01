return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup({
      settings = {
        save_on_toggle = true,
      },
    })

    vim.keymap.set('n', '<C-q>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon' })
    vim.keymap.set('n', '<C-m>', function() -- Also is triggered by CR
      harpoon:list():add()
      vim.notify('Harpoon mark settled')
    end, { desc = 'Set harpoon mark' })

    -- Harpoon sometimes jumps to a previously indexed position when using a mark
    -- that leads to the same file currently being displayed. This will only run
    -- when the mark leads to a different file.
    local select = function(selection)
      for i, item in pairs(harpoon:list().items) do
        if i ~= selection then
          goto continue
        end

        local item_path = vim.fs.normalize(item.value)

        if not vim.startswith(item_path, '/') then
          local root = vim.fn.getcwd()
          item_path = vim.fs.normalize(root .. '/' .. item_path)
        end

        local buf_path = vim.fs.normalize(vim.api.nvim_buf_get_name(0))

        if buf_path == item_path then
          return
        end

        harpoon:list():select(selection)

        ::continue::
      end
    end

    vim.keymap.set('n', '<C-l>', function()
      select(1)
    end, { desc = 'Go to harpoon mark 1' })
    vim.keymap.set('n', '<C-k>', function()
      select(2)
    end, { desc = 'Go to harpoon mark 2' })
    vim.keymap.set('n', '<C-j>', function()
      select(3)
    end, { desc = 'Go to harpoon mark 3' })
    vim.keymap.set('n', '<C-h>', function()
      select(4)
    end, { desc = 'Go to harpoon mark 4' })
  end,
}
