return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local harpoon = require('harpoon')

    require('custom.helpers').map_ctrl_j_hl('harpoon')

    harpoon:setup({
      settings = {
        save_on_toggle = true,
      },
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'harpoon',
      callback = function()
        -- Go to normal mode when saving
        vim.keymap.set({ 'n', 'i', 'x', 's' }, '<C-s>', '<Esc><cmd>w<CR>', { buffer = true })
      end,
    })

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

    vim.keymap.set('n', '<C-q>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon' })

    vim.keymap.set('n', '<leader>fh', function()
      local conf = require('telescope.config').values
      local harpoon_files = harpoon:list()
      local file_paths = {}

      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end, { desc = 'Find harpoon marks' })

    vim.keymap.set('n', '<C-m>', function() -- Also is triggered by CR
      for _, item in pairs(harpoon:list().items) do
        local item_path = vim.fs.normalize(item.value)

        if not vim.startswith(item_path, '/') then
          local root = vim.fn.getcwd()
          item_path = vim.fs.normalize(root .. '/' .. item_path)
        end

        local buf_path = vim.fs.normalize(vim.api.nvim_buf_get_name(0))

        if buf_path == item_path then
          vim.notify('Mark already settled')
          return
        end
      end

      harpoon:list():add()
      local last_index = #harpoon:list().items

      vim.notify('Mark added at index ' .. last_index)
    end, { desc = 'Set harpoon mark' })
  end,
}
