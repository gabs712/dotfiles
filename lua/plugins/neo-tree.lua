return {
	{
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	"MunifTanjim/nui.nvim",
},
config = function()
	vim.cmd('Neotree reveal show left')

	require('neo-tree').setup({
		close_if_last_window = true,
	})

	vim.keymap.set('n', '<leader>E', '<cmd>Neotree toggle reveal show left<CR>')
	vim.keymap.set('n', '<leader>e', function()
		-- If a tree is being foucused, go to previous window
		if vim.bo.filetype:match('^neo%-tree') then
			vim.cmd('wincmd p')
			return
		end

		-- If there is a tree, focus it
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			local buf = vim.api.nvim_win_get_buf(win)
			local bufname = vim.api.nvim_buf_get_name(buf)
			local filetype = vim.api.nvim_buf_get_option(buf, 'filetype')

			if filetype == 'neo-tree' then
				vim.api.nvim_set_current_win(win)
				return
			end
		end	

		-- If there is not a tree, create a new one
		vim.cmd('Neotree reveal focus left')
	end)
end
	}
}
