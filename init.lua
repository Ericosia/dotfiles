vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes" 
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.wrap = false
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>D", vim.diagnostic.setloclist)

vim.pack.add({
	{ src="https://github.com/tiagovla/tokyodark.nvim" },

	{ src = "https://github.com/echasnovski/mini.completion" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },

	{ src="https://github.com/echasnovski/mini.pick" },
	{ src="https://github.com/stevearc/oil.nvim" }

})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
  end,
})

vim.cmd [[set completeopt+=menuone,noselect,popup]]

require("mini.completion").setup({
  delay = { completion = 100 },
  window = { info = { border = "rounded" } },
})
require "mini.pick".setup()
require "oil".setup()


vim.lsp.config("asm_lsp", {
  cmd = { "asm-lsp" },
  filetypes = { "asm" },
  single_file_support = true,
})

vim.lsp.enable({ "clangd", "asm_lsp" })


vim.cmd.colorscheme("tokyodark")
-- vim.cmd([[
--   highlight Normal guibg=NONE ctermbg=NONE
--   highlight NormalNC guibg=NONE ctermbg=NONE
--   highlight EndOfBuffer guibg=NONE ctermbg=NONE
-- ]])
