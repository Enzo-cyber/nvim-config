-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'Toggle file explorer', silent = true })
vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

vim.cmd [[
  cnoreabbrev <expr> Ex getcmdtype() == ':' && getcmdline() ==# 'Ex' ? 'Neotree toggle' : 'Ex'
]]

require('neo-tree').setup {
  filesystem = {
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}

-- Keep every part of Neo-tree on the same pure-black background while
-- preserving each highlight group's foreground color and text styling.
for name, highlight in pairs(vim.api.nvim_get_hl(0, {})) do
  if name:match '^NeoTree' then
    highlight.bg = 0x000000
    highlight.link = nil
    vim.api.nvim_set_hl(0, name, highlight)
  end
end
