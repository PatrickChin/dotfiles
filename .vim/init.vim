
" Plugins {{{

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-markdown'
	Plug 'tpope/vim-repeat'
	Plug 'maxbrunsfeld/vim-emacs-bindings'
	Plug 'vim-scripts/a.vim'
	Plug 'Ron89/thesaurus_query.vim'
	Plug 'Raimondi/delimitMate'

	Plug 'honza/vim-snippets'
	Plug 'rbonvall/snipmate-snippets-bib'
	Plug 'SirVer/ultisnips'
	Plug 'vim-pandoc/vim-pandoc'
	Plug 'lervag/vimtex'
	Plug 'davidhalter/jedi-vim'
	Plug 'Valloric/YouCompleteMe'

	Plug 'nanotech/jellybeans.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
call plug#end()

" }}}

" Plugin Variables {{{

" airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='base16_ocean'

" youcompleteme
let g:ycm_auto_trigger=0
let g:ycm_confirm_extra_conf=1
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_warning_symbol='>'

" utilsnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_latexmk_continuous=1
let g:vimtex_latexmk_background=1

" jedi
let g:jedi#force_py_version=3

" }}}

" General {{{

colorscheme jellybeans

set nobackup
set noswapfile

set textwidth=80
set colorcolumn=+1

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

set dictionary+=/usr/share/dict/words

set foldenable
set foldmethod=marker
set foldmarker={{{,}}}
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

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Space> i<Space><Esc>l
nnoremap <CR> i<CR><Esc>

nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>ey :e ~/.vim/.ycm_extra_conf.py<cr>
nnoremap <leader>es :Lex ~/.vim/plugged/vim-snippets/UltiSnips/<cr>
nnoremap <leader>s :source %<cr>
nnoremap <leader><S-s> :source %<cr>:PlugInstall<cr>


nnoremap <silent> <Leader>yy :YcmOn<CR>
nnoremap <silent> <Leader>yd :YcmCompleter GetDoc<CR>
nnoremap <silent> <Leader>yf :YcmCompleter FixIt<CR>
nnoremap <silent> <Leader>yi :YcmCompleter GoToInclude<CR>
nnoremap <silent> <Leader>yt :YcmCompleter GetType<CR>
nnoremap <silent> <leader>jd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <silent> <leader>jf :YcmCompleter GoToDefinition<CR>

vnoremap aa mz<Esc>ggVG

nnoremap <leader>y mzggVGy`z
nnoremap <leader>Y mzggVG"+y`z

inoremap kj <Esc>
cnoremap kj <Esc>
cnoremap KJ <Esc>
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

nnoremap <f12> :!urxvt &<cr>

" Not sure who to give credit to for this
" This command will allow us to save a file we don't have permission to save
" *after* we have already opened it. Super useful.
cnoremap w!! w !sudo tee % >/dev/null
cnoremap w!1 w !sudo tee % >/dev/null

" }}}

" Autocmds {{{

autocmd FileType vim,help setlocal keywordprg=:help | only

autocmd BufNewFile,BufFilePre,BufRead *.sty set filetype=tex
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd Filetype markdown nnoremap <buffer> <leader>ll :!pandoc % -o notes.html --mathjax -s

autocmd FileType matlab setlocal commentstring=\%%s
autocmd FileType cmake setlocal commentstring=\#%s

autocmd BufNewFile,BufRead /usr/include/** set ft=cpp ts=8
autocmd BufNewFile,BufRead /home/patrick/src/coreutils/** set ts=8
autocmd BufNewFile,BufRead /home/patrick/workspace/programming-challenges/**
			\ set expandtab
autocmd BufNewFile,BufRead /home/patrick/workspace/sptr-analysis/**
			\ set tabstop=8 softtabstop=2 shiftwidth=2

"}}}
