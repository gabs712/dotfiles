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
    vim.keymap.set({'n', 'x'}, "<C-m>", function() 
      harpoon:list():add()
      print('Mark settled  ' .. os.date("%H:%M:%S"))
    end, {desc = 'Set harpoon mark'})

    vim.keymap.set({'n', 'x'}, "<C-1>", function() harpoon:list():select(1) end, {desc = 'Go to harpoon mark 1'})
    vim.keymap.set({'n', 'x'}, "<C-2>", function() harpoon:list():select(2) end, {desc = 'Go to harpoon mark 2'})
    vim.keymap.set({'n', 'x'}, "<C-3>", function() harpoon:list():select(3) end, {desc = 'Go to harpoon mark 3'})
    vim.keymap.set({'n', 'x'}, "<C-4>", function() harpoon:list():select(4) end, {desc = 'Go to harpoon mark 4'})
    vim.keymap.set({'n', 'x'}, "<C-5>", function() harpoon:list():select(5) end, {desc = 'Go to harpoon mark 5'})
    vim.keymap.set({'n', 'x'}, "<C-6>", function() harpoon:list():select(6) end, {desc = 'Go to harpoon mark 6'})
    vim.keymap.set({'n', 'x'}, "<C-7>", function() harpoon:list():select(7) end, {desc = 'Go to harpoon mark 7'})
    vim.keymap.set({'n', 'x'}, "<C-8>", function() harpoon:list():select(8) end, {desc = 'Go to harpoon mark 8'})
    vim.keymap.set({'n', 'x'}, "<C-9>", function() harpoon:list():select(9) end, {desc = 'Go to harpoon mark 9'})

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

