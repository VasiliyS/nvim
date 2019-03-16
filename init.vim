" vim-plug section
call plug#begin('~/.local/share/nvim/plugged')
	" arline - cool status line
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	"Solarized
	Plug 'iCyMind/NeoSolarized'
	"Git gutter
	Plug 'airblade/vim-gitgutter'
	"Nerd Tree
	Plug 'scrooloose/nerdtree'
	"Plug 'jreybert/vimagit'
	" figutive
	Plug 'tpope/vim-fugitive'
	" -- generic language tools ---
	"  Syntastic
	Plug 'vim-syntastic/syntastic'
	Plug 'autozimu/LanguageClient-neovim', {
	    \ 'branch': 'next',
	    \ 'do': 'bash install.sh',
	    \ }

	" (Optional) Multi-entry selection UI.
	Plug 'junegunn/fzf'
	" Deoplete completion
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	" Tagbar
	Plug 'majutsushi/tagbar'
	" Rust ------------------
	Plug 'rust-lang/rust.vim'
call plug#end()

" enable Solarized
syntax enable
set termguicolors
set background=dark
colorscheme NeoSolarized

" reduce update time for git gutter
set updatetime=100
map <C-n> :NERDTreeToggle<CR>

" powerline fonts - doesn't work for nongui version of Vim
set guifont=Liberation\ Mono\ for\ PowerLine\ 10
let g:airline_powerline_fonts=1

" Language client settings
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
