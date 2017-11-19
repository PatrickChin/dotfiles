
" Plugins {{{

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'		" Don't really know what's in here to be honest
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'		" [ and ] (on and off) bindings for things
Plug 'tpope/vim-fugitive'		" Git integration
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'			" Auto-detect shift and tab width
Plug 'tpope/vim-rsi'			" Emacs mappings for insert and command modes
Plug 'tpope/vim-eunuch'			" UNIX shell commands
Plug 'tpope/vim-vinegar'
Plug 'sjl/gundo.vim'			" Undo tree
Plug 'sfiera/vim-emacsmodeline'
Plug 'vim-scripts/a.vim'		" swap between header and source file

" Plug 'scrooloose/nerdtree'
Plug 'Ron89/thesaurus_query.vim'
Plug 'chrisbra/Colorizer'

Plug 'honza/vim-snippets'
Plug 'rbonvall/snipmate-snippets-bib'
Plug 'SirVer/ultisnips'

Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-markdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'lervag/vimtex'
Plug 'davidhalter/jedi-vim'
" Plug 'zchee/deoplete-jedi'	" I don't know what this is
Plug 'Valloric/YouCompleteMe'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nanotech/jellybeans.vim'

call plug#end()

" }}}

" Plugin Variables {{{

" airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='base16_ocean'

" youcompleteme
let g:ycm_auto_trigger=0
" let g:ycm_confirm_extra_conf=0
" let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion=['<C-n>', '<Tab>']
let g:ycm_key_list_previous_completion=['<C-p>', '<S-Tab>']
let g:ycm_warning_symbol='>'
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_add_preview_to_completeopt=1
let g:ycm_use_ultisnips_completer=1

" utilsnips
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsEnableSnipMate=0

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_latexmk_continuous=1
let g:vimtex_latexmk_background=1

" jedi
let g:jedi#force_py_version=3
let g:jedi#completions_enabled=0

" }}}

" General {{{

colorscheme jellybeans

set nobackup
set noswapfile

set colorcolumn=80

set mouse=a
set hidden
set number
set relativenumber
set nowrap
set ignorecase
set smartcase

set autochdir
set autoread
set autoindent
set hlsearch
set incsearch
set cursorline
set cursorcolumn

set list
set listchars=tab:>-,trail:-

set wildmenu
set wildmode=longest,list,full
set wildignore+=.git,*.o,*.a,*.class,*.so,*.swp
set wildignore+=*.iso,*.zip,*.gz
set wildignore+=*.aux
set wildignore+=*.jpg,*.png,*.gif,*.pdf
set wildignore+=*.mp3,*.m4a,*.mp4
set wildignore+=*.aux,*.lof,*.lot,*.fls,*.out,*.toc,*.fmt,*.fot,*.cb,*.cb2


set dictionary+=/usr/share/dict/words

set foldenable
" set foldmethod=marker
" set foldmarker={{{,}}}
set foldlevelstart=99
set foldnestmax=10
set nostartofline

set shiftwidth=4
set tabstop=4
set softtabstop=4

set modelines=3

set guioptions-=T
set guifont=Inconsolata\ 12

" }}}

" Mappings {{{

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

nnoremap j gj
nnoremap k gk

nnoremap <F2> :Lex<CR>
" nnoremap <F2> :NERDTreeToggle<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Space> i<Space><Esc>l
nnoremap <CR> i<CR><Esc>

nnoremap <leader>ev :e ~/.vim/init.vim<cr>
nnoremap <leader>ey :e ~/.vim/.ycm_extra_conf.py<cr>
nnoremap <leader>es :Lex ~/.vim/plugged/vim-snippets/UltiSnips/<cr>
nnoremap <leader>s :source %<cr>
nnoremap <leader><S-s> :source %<cr>:PlugInstall<cr>


nnoremap <silent> <leader>yd :YcmCompleter GetDoc<CR>
nnoremap <silent> <leader>yf :YcmCompleter FixIt<CR>
nnoremap <silent> <leader>yi :YcmCompleter GoToInclude<CR>
nnoremap <silent> <leader>yt :YcmCompleter GetType<CR>
nnoremap <silent> <leader>jd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <silent> <leader>jf :YcmCompleter GoToDefinition<CR>

vnoremap aa mz<Esc>ggVG

nnoremap <leader>y mzggVGy`z
nnoremap <leader>Y mzggVG"+y`z

inoremap {<CR> {<CR>}<Esc>ko

inoremap kj <Esc>
cnoremap kj <Esc>
cnoremap KJ <Esc>
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>
nnoremap <C-x> :bd<CR>
nnoremap <C-q> :q<CR>

nnoremap <f12> :!urxvt &<cr>

" Not sure who to give credit to for this
" This command will allow us to save a file we don't have permission to save
" *after* we have already opened it. Super useful.
cnoremap w!! w !sudo tee % >/dev/null
cnoremap w!1 w !sudo tee % >/dev/null

" }}}

" Autocmds {{{

autocmd FileType vim,help setlocal keywordprg=:help

autocmd BufNewFile,BufFilePre,BufRead *.sty set filetype=tex
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd Filetype markdown nnoremap <buffer> <leader>ll :!pandoc % -o notes.html --mathjax -s

autocmd FileType c,cpp setlocal commentstring=//%s
autocmd FileType matlab setlocal commentstring=\%%s
autocmd FileType cmake setlocal commentstring=\#%s

" autocmd BufNewFile,BufRead /usr/include/**,/usr/lib/**
" 			\ if expand('%:t') !~ '\.' | set ft=cpp ts=8 | else | set ts=8 | endif
autocmd BufNewFile,BufRead /usr/include/**,/usr/lib/**,
			\/home/patrick/src/coreutils/**  set ts=8
autocmd BufNewFile,BufRead /home/patrick/workspace/programming-challenges/**
			\ set expandtab
autocmd BufNewFile,BufRead /home/patrick/workspace/sptr-analysis/**
			\ set tabstop=8 softtabstop=2 shiftwidth=2

"}}}
