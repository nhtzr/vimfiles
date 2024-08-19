vim.o.compatible=false

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  { 'echasnovski/mini.nvim', version = false },
  { "NeogitOrg/neogit",
     dependencies = { "nvim-lua/plenary.nvim" },
  },
})
require('mini.ai').setup({
  custom_textobjects = {
    e = function()
      local from = { line = 1, col = 1 }
      local to = {
        line = vim.fn.line('$'),
        col = math.max(vim.fn.getline('$'):len(), 1)
      }
      return { from = from, to = to, vis_mode = 'V' }
    end
  }
})
require('mini.align').setup({
  mappings = {
    start = '',
    start_with_preview = '<leader>t',
  }
})
require('mini.trailspace').setup()
function requireNeogit()
  vim.keymap.set('n', 'q', vim.cmd.quit, { noremap = true, silent = true })
  local neogit = require('neogit')
  neogit.setup {
    kind = "replace",
    log_view = {
      kind = "replace"
    },
    reflog_view = {
      kind = "replace",
    },
    popup = {
      kind = "vsplit"
    },
    mappings = {
      status = {
        ["o"] = "GoToFile",
        ["q"] = false,
        ["I"] = false,
        ["x"] = false,
        ["s"] = false,
        ["S"] = false,
        ["<c-s>"] = false,
        ["u"] = false,
        ["K"] = false,
        ["U"] = false,
      }
    },
  }
  local git = require("neogit.lib.git")
  function f(offset)
    return git.log.list( { 'HEAD', ("--skip=%s"):format(offset) }, nil, nil, false, nil )
  end
  local commits = git.log.list( {'HEAD'}, nil, nil, false, nil )
  local LogViewBuffer = require("neogit.buffers.log_view")
  LogViewBuffer.new( commits, {}, {}, f, "Commits in " .. git.branch.current()):open()
end

-- Most important
-- Annoying sounds stop

vim.o.visualbell = true
vim.o.directory  = vim.fn.stdpath('data') .. "/vim_tmp"
vim.o.scrolloff  = 3
vim.o.history    = 50

vim.o.wildignorecase = true
vim.o.infercase      = true
vim.o.ignorecase     = true
vim.o.smartcase      = true

vim.o.number = true
vim.o.wrap   = false

vim.o.hlsearch  = true
vim.o.showmatch = false

vim.o.shiftwidth  = 2
vim.o.tabstop     = 2
vim.o.softtabstop = 2
vim.o.expandtab   = true
vim.o.linebreak   = true
vim.o.autoread    = false
vim.o.foldlevel   = 9999

-- FROM sensible.vim
vim.o.encoding   = 'utf-8'
vim.o.autoindent = true
vim.o.backspace  = 'indent,eol,start'
vim.o.incsearch  = true
vim.o.laststatus = 2
vim.o.ruler      = true
vim.o.showcmd    = true
vim.o.wildmenu   = true
vim.o.display    = 'lastline'
vim.o.listchars  = [[tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+]]
vim.o.hidden     = true

-- set colors
vim.o.termguicolors=false
vim.cmd.syntax('on')
vim.cmd.filetype('plugin indent on')
vim.cmd.colorscheme('desert')
vim.cmd.highlight('LineNr guibg=NONE')
-- Some syntax plugins light to highlight {} or () forever
-- I want to see them as normal text
-- normal_parens can also be manually called later with a nnoremap
function normal_parens()
  vim.cmd([[
    syntax match _parens /[(){}]/
    hi _parens ctermfg=NONE ctermbg=NONE
  ]])
end
-- vim.api.nvim_create_autocmd('Syntax', {pattern="*", callback = normal_parens})

-- Plugin options
vim.g.scratch_persistence_file = vim.fn.stdpath('data') .. '/.scratch'
vim.g.scratch_no_mappings      = 1
vim.g.gitgutter_diff_base      = 'HEAD'
vim.g.gitgutter_diff_args      = '-w'
vim.g.gitgutter_map_keys       = 0
vim.g.gitgutter_enabled        = 0
vim.g.airline_powerline_fonts  = 1
vim.g.airline_theme            = 'base16_tomorrow'

-- <<Pressing shift is hard>> bindings
vim.keymap.set({'n', 'v'}, ';', ':',   { noremap = true })
vim.keymap.set({'n', 'v'}, ',', ';',   { noremap = true })
vim.keymap.set('n',        '@;', '@:', { noremap = true })
vim.keymap.set('n',        'Y',  'y$', { noremap = true })
vim.keymap.set('v',        'Y',  '$y', { noremap = true })

-- Native copy bindings
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', { noremap = true })
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p', { noremap = true })
vim.keymap.set({'n', 'v'}, '<leader>P', '"+P', { noremap = true })

vim.keymap.set('v', '<Tab>',   '>gv', { noremap = true })
vim.keymap.set('v', '<S-Tab>', '<gv', { noremap = true })

vim.keymap.set('n', 'Q', 'qq',              { noremap = true })
vim.keymap.set('v', 'Q', ':normal <Right>', { noremap = true })
vim.keymap.set('v', 'q', ':normal <Right>', { noremap = true })
vim.keymap.set('v', '@', ':normal @q<CR>',  { noremap = true, silent = true })

vim.keymap.set('n', 'zK', 'zkzx', { noremap = true })
vim.keymap.set('n', 'zJ', 'zjzx', { noremap = true })

-- Settings bindings
vim.keymap.set('n', '<leader>w', function() vim.o.wrap=true           end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>W', function() vim.o.wrap=false          end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>v', function() vim.o.virtualedit='all'   end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>V', function() vim.o.virtualedit='block' end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>b', normal_parens,                            { noremap = true, silent = true })

-- Cleanup bindings
vim.keymap.set('n', '<leader>st', MiniTrailspace.trim,             { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sT', MiniTrailspace.trim_last_lines,  { noremap = true, silent = true })
-- No longer necessary, see :help Ctrl-L
-- vim.keymap.set('n', '<C-L>',      function() vim.o.hlsearch=false     end, { noremap = true, silent = true })

-- Folding
vim.keymap.set('n', '<leader>fmi', function() vim.o.foldmethod='indent' end,  { noremap = true, silent = true })
vim.keymap.set('n', '<leader>f0',  function() vim.o.foldlevel=0 end,          { noremap = true, silent = true })

