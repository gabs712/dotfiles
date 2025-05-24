return {
  'yetone/avante.nvim',
  version = false,
  build = 'make',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',

    'nvim-tree/nvim-web-devicons',
    'nvim-telescope/telescope.nvim',
    'hrsh7th/nvim-cmp', -- Completion for commands and mentions
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'Avante' },
        anti_conceal = {
          enabled = false, -- Shows chars original appearence on current line
        },
        win_options = {
          concealcursor = {
            rendered = 'nic', -- Conceals raw markdown chars on current line
          },
        },
      },
      ft = { 'Avante' },
    },
  },
  config = function()
    require('custom.helpers').shell_movements({ 'AvantePromptInput', 'AvanteInput' })

    require('avante').setup({
      -- claude | openai | azure | gemini | cohere | copilot
      provider = os.getenv('AI_PROVIDER'),
      web_search_engine = {
        -- tavily | serpapi | searchapi | google | kagi | brave | searxng
        provider = os.getenv('SEARCH_PROVIDER') or 'tavily',
      },
      behaviour = {
        enable_token_counting = true,
      },
      hints = { enabled = false }, -- Virtual text on visual mode
      windows = {
        sidebar_header = {
          enabled = true,
          align = 'right', -- left, center, right for title
        },
        position = 'right',
        wrap = true,
        width = 50,
        input = {
          prefix = '> ',
          height = 8,
        },
        ask = {
          start_insert = false,
        },
      },
      mappings = {
        diff = {
          ours = '<leader>[',
          theirs = '<leader>]',
          cursor = '<leader>{',
          all_theirs = '<leader>}',
          both = '<leader>=',
          next = ']g',
          prev = '[g',
        },
        suggestion = {
          accept = '<Tab>',
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-]>',
        },
        jump = {
          next = ']]',
          prev = '[[',
        },
        submit = {
          normal = '<C-s>',
          insert = '<C-s>',
        },
        cancel = {
          normal = { '<C-c>' },
          insert = { '<C-c>', '<Esc>' },
        },
        sidebar = {
          apply_all = 'A',
          apply_cursor = 'a',
          retry_user_request = 'r',
          edit_user_request = 'e',
          switch_windows = '<C-l>',
          reverse_switch_windows = '<C-k>',
          remove_file = 'D',
          add_file = '@',
          close = { '<C-c>' },
          close_from_input = { normal = '<C-c>', insert = '<C-c>' },
        },
      },
    })

    vim.keymap.set({ 'n', 'x' }, '<leader>w', '<cmd>AvanteToggle<CR>', { desc = 'Toggle Avante' })
    vim.keymap.set('n', '<leader>as', '<Nop>')

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'AvanteConfirm',
      callback = function()
        vim.keymap.set('n', '<Esc>', '<Nop>', { buffer = true, remap = true })
        vim.keymap.set('n', '<C-k>', 'n', { buffer = true, remap = true })
        vim.keymap.set('n', '<C-j>', 'y', { buffer = true, remap = true })
      end,
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'AvantePromptInput',
      callback = function()
        vim.keymap.set({ 'n', 'i' }, '<C-j>', '<C-s>', { buffer = true, remap = true })
      end,
    })
  end,
}
