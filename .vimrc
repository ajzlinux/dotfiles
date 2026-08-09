call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'rhysd/vim-clang-format'
Plug 'ryanoasis/vim-devicons'
call plug#end()

let g:ale_linters = {
\   'c': ['gcc'],
\   'sh': ['shellcheck'],
\}
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_cursor_detail = 0
let g:ale_close_preview_on_insert = 1

let g:clang_format#code_style = 'llvm'
let g:clang_format#style_options = {
\   'BreakBeforeBraces' : 'Allman',
\}
let g:clang_format#auto_format = 1

autocmd FileType c,cpp nnoremap <buffer> <Leader>cf :ClangFormat<CR>

let g:airline_theme='dark'
let g:airline_powerline_fonts = 1

syntax on
set tags=./tags,tags;
set number
set relativenumber
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set hlsearch
set incsearch
set ignorecase
set smartcase
set clipboard=unnamedplus
set cursorline
set wildmenu
set undofile
set undodir=~/.vim/undodir
set backup
set backupdir=~/.vim/backup//
set swapfile
set scrolloff=8
set showmatch
set mouse=a
set laststatus=2
set belloff=all
set nowrap
set splitright
set splitbelow
inoremap jj <Esc>
nnoremap <Space>w :w<CR>
nnoremap <Esc> :noh<CR><Esc>
filetype plugin indent on
nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1
