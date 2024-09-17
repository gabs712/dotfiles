return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim' },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup({
      settings = {
        save_on_toggle = true
      }
    })

    vim.keymap.set({'n', 'x'}, "<Tab>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = 'Harpoon marks'})
    vim.keymap.set({'n', 'x'}, "<S-m>", function()
      harpoon:list():add()
      print('Harpoon mark settled ' .. os.date("%H:%M:%S"))
    end, {desc = 'Set harpoon mark'})

    vim.keymap.set({'n', 'x'}, "<C-l>", function() harpoon:list():select(1) end, {desc = 'Go to harpoon mark 1'})
    vim.keymap.set({'n', 'x'}, "<C-k>", function() harpoon:list():select(2) end, {desc = 'Go to harpoon mark 2'})
    vim.keymap.set({'n', 'x'}, "<C-j>", function() harpoon:list():select(3) end, {desc = 'Go to harpoon mark 3'})
    vim.keymap.set({'n', 'x'}, "<C-h>", function() harpoon:list():select(4) end, {desc = 'Go to harpoon mark 4'})

    -- Telescope configuration
    vim.keymap.set("n", "<leader>fm",  function()
      local conf = require("telescope.config").values
      local harpoon_files = harpoon:list()
      local file_paths = {}

      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon Marks",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end, { desc = "Find harpoon marks" })
  end
}

