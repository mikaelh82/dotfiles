-- Disable automatic comment continuation
vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

-- Quick close with 'q' for special buffers
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {
    "netrw", "help", "man", "lspinfo", "spectre_panel", 
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

-- Check file changes
vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  pattern = {"*"},
  callback = function()
    vim.cmd "checktime"
  end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd({"TextYankPost"}, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 40 }
  end,
})

-- Enable word wrap and spell check for specific files
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"gitcommit", "markdown"},
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd "normal! g'\""
    end
  end,
})
