let maplocalleader = " " 
let mapleader = " " 

call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'https://github.com/tpope/vim-commentary'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/NERDTree'
nnoremap <C-t> :NERDTreeToggle<CR>  
Plug 'ryanoasis/vim-devicons'

Plug 'neoclide/coc.nvim' 
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <down> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <up> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='gruvbox'

" ------------------------------
"          UltiSnips
"  SOURCES
"      https://castel.dev/post/lecture-notes-1/ 
"      https://www.ejmastnak.com/tutorials/vim-latex/ultisnips/#getting-started-with-ultisnips
"      https://www.youtube.com/watch?v=RlseJkeVqj4
"  -----------------------------
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=['.config/nvim/UltiSnips', 'UltiSnips']  " using Neovim 

" ---------------
"     Vimtex
" ---------------
Plug 'lervag/vimtex' 
set conceallevel=1 " these two lines sets the \[ \] $ invisible (for writing equations) so that they aren't as obtrusive
let g:tex_conceal='abdmg'
let g:vimtex_view_method = 'sioyek'
nnoremap <leader>vv <cmd>VimtexView<cr>

" -------------------
"    Colorschemes
" -------------------
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'cpea2506/one_monokai.nvim'
Plug 'morhetz/gruvbox'

call plug#end()

lua << EOF
require("nvim-treesitter.configs").setup({
    ensure_installed = { "javascript", "typescript", "lua", "vim", "json", "html", "rust", "tsx", "c" },
    sync_install = false,
    -- auto_install = true,
    highlight = {
        enable = true,
    },
})
EOF

syntax on
set ignorecase
set smartcase
set scrolloff=10
set hidden                " When opening new file in current buffer causes file to be hidden instead of closed 
set number                " Shows line number
set autoindent            " Allows autoindent
set smarttab              " Makes tabbing smarter somehow  
set softtabstop=4         " idk
set nowrap               
color gruvbox
set background=dark
set mouse=a               " allows you to use the cursor 
" set guicursor=i:block     " changes the insert mode cursor to be a block
set noswapfile            " no more swapfiles
set noshowmode            " no longer shows what mode you are in (currently doesn't work with vim-airline)
set tabstop=4             " the number of spaces that you want for the tabs 
set shiftwidth=4          " idk
set expandtab             " changes tabs into spaces (not working currently)
let g:markdown_fenced_languages = ['html', 'python', 'lua', 'vim', 'typescript', 'javascript', 'c', 'sql']

nnoremap <C-z> u<CR>
nnoremap <C-y> <C-R>
inoremap <C-Z> <C-O>u
inoremap <C-Y> <C-O><C-R>

" Inkscape Figures 
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/../figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/../figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

" ----------
"    Tabs 
" ----------
nnoremap H gT 
nnoremap L gt 
nnoremap T :tabnew<CR>
nnoremap W :q<CR>
nnoremap <C-n> :tabmove -1<CR>
nnoremap <C-m> :tabmove +1<CR>
nnoremap <C-q> :bd<CR>

" -----------
"   Splits 
" -----------
set splitbelow splitright 

" Bind copy and paste 
nnoremap <C-c> "*y 

" Split keybinds 
map <Leader>vs :vsplit<CR>
map <Leader>hs :split<CR> 

" Remap splits navigation to just CTRL + hjkl 
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k 
nnoremap <C-l> <C-w>l

" Adjust the size the the split
nnoremap <silent> <C-Left> :vertical resize +1<CR>
nnoremap <silent> <C-Right> :vertical resize -1<CR>
nnoremap <silent> <C-Up> :resize +1<CR>
nnoremap <silent> <C-Down> :resize -1<CR>

" Change 2 split windows from vert to horiz or horiz to vert 
map <Leader>th <C-w>t<C-w>H 
map <Leader>tk <C-w>t<C-w>K

" Open terminal in a split 
map <Leader>tt :vnew term://zsh<CR>
map <Leader>tT :new term://zsh<CR>

" pdflatex
map <leader>lL :!pdflatex -shell-escape %<CR>

" Copy and paste 
nnoremap <leader>y "*y<CR>
