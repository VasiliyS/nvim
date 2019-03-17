" Add automatic install of vim-plug

let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
	silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs 
		\ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

unlet autoload_plug_path 

"vim-plug section

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
	"Plug 'vim-syntastic/syntastic'
	" LSC Ale
	Plug 'w0rp/ale'
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
set hidden

" Deoplete config
 let g:deoplete#enable_at_startup = 1
" Deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" --------  ale settings ------------
le config
let g:ale_rust_rls_toolchain = "stable"
let g:ale_linters = {
            \ 'python': ['pylint', 'pyls'],
            \ 'rust': ['rls', 'cargo'],
            \ 'bash': ['shellcheck'],
            \ }

let g:ale_fix_on_save = 1
let g:ale_fixers = {
            \ 'rust': ['rustfmt'],
            \ 'bash': ['shfmt'],
            \ }

