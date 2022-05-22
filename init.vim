" temporary cheatsheet
" FOLDING
" Manual folding :mkview saves folds in file, :loadview loads folds in file
" {Visual}zf create fold
" zd delete fold
" zo open fold
" zc close fold

" neovim options
set path+=**
set wildmenu
set title titlestring=%F

set clipboard+=unnamedplus
set showmatch
set ignorecase
set autoindent
set number
set cursorline
set cc=80

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set termguicolors

" set listchars

" load plugins
if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

"plugins loading
call plug#begin()
    Plug 'scrooloose/nerdtree'

    Plug 'neoclide/coc.nvim', {'branch':'release'}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'tpope/vim-fugitive'

    Plug 'othree/html5.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'evanleck/vim-svelte', {'branch':'main'}

    Plug 'rstacruz/vim-closer'
    Plug 'mattn/emmet-vim'

    "UI THEME
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'dylanaraps/wal.vim'
    Plug 'rktjmp/lush.nvim'
    Plug 'jpacs/wallush'
    Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()

"colorscheme
lua << END
    -- require('wallush/colors')
END
colorscheme wallush
" shortcuts/remaps
" reload/edit config and theme files
nnoremap <silent> <Leader><Leader> :source $MYVIMRC<bar>lua print(' Config File Reloaded ')<CR>
nnoremap <silent> <Leader>c :e $MYVIMRC<CR> 
nnoremap <silent> <Leader>cv :tabnew $MYVIMRC<CR> 
nnoremap <silent> <Leader>ct :tabnew ~/Dev/wallush/lua/lush_theme/wallush.lua<CR> 
" shortcuts
nnoremap <Leader>e <Esc>:e<Space>
nnoremap <Leader>b <Esc>:b<Space>
nnoremap <Leader>rr <Esc>:%s/
nnoremap <silent> <Leader>s <Esc>:update<CR>
nnoremap <silent> <Leader>d :NERDTreeToggle<CR>
nnoremap <silent> <Leader>w <Esc>:w<bar>q<CR>
nnoremap <silent> <Leader>q <Esc>:w<bar>bd<CR>
nnoremap <silent> <Leader>bd <Esc>:bd<CR>
nnoremap <silent> <Leader>qq <Esc>:bd<CR>
nnoremap <silent> <Leader><Esc> <Esc>:noh<CR>
" folding
nn <silent> <Leader>mv :mkview<bar>lua print(vim.fn.expand('%:t'),' - View file created')<CR> 
nn <silent> <Leader>lv :loadview<bar>lua print(vim.fn.expand('%:t'),' - View file loaded')<CR> 

nnoremap <silent> <Leader>h <Esc>:tabprevious<CR>
nnoremap <silent> <Leader>l <Esc>:tabnext<CR>

nnoremap <c-z> <nop>
set mouse=a
inoremap <silent> <RightMouse> <CR>
nnoremap <HOME> ^
nnoremap <A-k> 10k
nnoremap <A-j> 10j

" emmet
"let g:user_emmet_leader_key='<C-K>'
let g:user_emmet_mode='inv'
" NerdTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 0
let g:NERDTreeIgnore = ['node_modules']
let NERDTreeStatusLine='NerdTree'
" CoC Svelte
let g:svelte_indent_script = 0
let g:svelte_indent_style = 0


lua << END
require'nvim-treesitter.configs'.setup{
    highlight = { enable = true }

}
-- lualine setup
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'pywal',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
        tablinemode = true
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = { 
            { 'branch',
                separator = { left = '', right = '' }

            },
            { 'diff',
                colored = true,
                diff_color = {
                    added = 'DiffAdd',
                    modified = 'DiffChange',
                    removed = 'DiffDelete'
                },
                symbols = {added = '+', modified = ' ~', removed = ' -'}
            },
        },
        lualine_c = {
            'filename',
            { 'diagnostics',
                source = { 'coc' },
                sections = { 'error', 'warh', 'info', 'hint' },
                symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
            } 
        },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    tabline = {
        lualine_a = {'mode'},
        lualine_b = {'buffers'},
        lualine_c = {},
        lualine_x = {"os.date('%X')"},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    extensions = {}
}

-- vim.opt.list = true
-- vim.opt.termguicolors = true
-- vim.opt.listchars:append("eol:↴")

-- indent_blankline setup
require("indent_blankline").setup {
    -- show_end_of_line = true,
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}


END
