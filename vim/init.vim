
" Plugins {{{

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source ~/.vim/init.vim
endif

call plug#begin('~/.vim/plugged')

" Plug 'tpope/vim-sensible'		" Don't really know what's in here to be honest
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'		" [ and ] (on and off) bindings for things
Plug 'tpope/vim-fugitive'		" Git integration
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'			" Auto-detect shift and tab width
Plug 'tpope/vim-rsi'			" Emacs mappings for insert and command modes
Plug 'tpope/vim-eunuch'			" UNIX shell commands
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-markdown'

" Plug 'bogado/file-line'

" Plug 'jlanzarotta/bufexplorer'
Plug 'airblade/vim-gitgutter'
Plug 'sfiera/vim-emacsmodeline'

Plug 'sjl/gundo.vim'			" Undo tree

Plug 'vim-scripts/a.vim'		" swap between header and source file
Plug 'francoiscabrol/ranger.vim'
Plug 'scrooloose/nerdtree'
"
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'google/vim-maktaba'		" ??
Plug 'google/vim-codefmt'

Plug 'Ron89/thesaurus_query.vim'

Plug 'honza/vim-snippets'
Plug 'rbonvall/snipmate-snippets-bib'
Plug 'SirVer/ultisnips'

" Plug 'leafgarland/typescript-vim'
" Plug 'vim-pandoc/vim-pandoc'
Plug 'lervag/vimtex'
" Plug 'davidhalter/jedi-vim'
" Plug 'jmcantrell/vim-virtualenv'
" Plug 'zchee/deoplete-jedi'	" I don't know what this is
Plug 'Valloric/YouCompleteMe'
" Plug 'keith/swift.vim'
" Plug 'bumaociyuan/vim-swift'
" Plug 'peterhoeg/vim-qml'

" Plug 'mattn/emmet-vim'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'

Plug 'rr-/vim-hexdec'
Plug 'chrisbra/Colorizer'		" colour hex codes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nanotech/jellybeans.vim'
" Plug 'jeffkreeftmeijer/vim-dim'

call plug#end()

" }}}

" Plugin Variables {{{

" airline
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_theme='base16_ocean'

" youcompleteme
let g:ycm_auto_trigger=0
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_auto_start_csharp_server=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_key_list_select_completion=['<C-n>', '<Tab>']
let g:ycm_key_list_previous_completion=['<C-p>', '<S-Tab>']
let g:ycm_warning_symbol='>'
let g:ycm_error_symbol='>'
let g:ycm_add_preview_to_completeopt=1

" let g:ycm_python_binary_path = 'python'
" let g:ycm_confirm_extra_conf=0
" let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_use_ultisnips_completer=1

" utilsnips
let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'
let g:UltiSnipsEnableSnipMate=1

" vimtex
let g:tex_flavor='xelatex'
let g:vimtex_view_method='zathura'
let g:vimtex_latexmk_continuous=1
let g:vimtex_latexmk_background=1

" jedi
let g:jedi#force_py_version=3
let g:jedi#completions_enabled=0

" in your plugin constants configuration section
let g:virtualenv_auto_activate=1

let g:netrw_fastbrowse=0

let g:fzf_preview_window = ''

" }}}

" General {{{

colorscheme jellybeans

set nobackup
set noswapfile
set backupcopy=yes

set colorcolumn=100

set mouse=a
set hidden
set number
set nowrap
set ignorecase
set smartcase
set relativenumber
set sidescroll=10

set synmaxcol=512
let c_curly_error=0
syntax sync minlines=50

set lazyredraw
set noeol
" set autochdir
" set autoread
set autoindent
set hlsearch
" set incsearch
" set cursorline
" set cursorcolumn
set tags=tags,./tags

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


"set dictionary+=/usr/share/dict/words

set foldenable
set foldmethod=indent
set foldmarker={,}
set foldlevelstart=10
set foldnestmax=10

set nostartofline

set shiftwidth=4
set tabstop=4
set softtabstop=4
" set expandtab

"set modelines=3

set guioptions-=T
set guifont=Courier\ 10

" }}}

" Mappings {{{

" nnoremap ; :
" nnoremap : ;
" vnoremap ; :
" vnoremap : ;

nnoremap j gj
nnoremap k gk

" nnoremap <F2> :Lex<CR>
nnoremap <F2> :NERDTreeToggle<CR>

" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" nnoremap <Space> i<Space><Esc>l
" nnoremap <CR> i<CR><Esc>

nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>ez :e ~/.zshrc<cr>
nnoremap <leader>ey :e ~/.vim/.ycm_extra_conf.py<cr>
nnoremap <leader>es :Lex ~/.vim/plugged/vim-snippets/UltiSnips/<cr>
nnoremap <leader>s :source %<cr>
nnoremap <leader><S-s> :source %<cr>:PlugInstall<cr>

nnoremap <silent> <leader>b  :<C-u>call gitblame#echo()<CR>
nnoremap <silent> <leader>yd :YcmCompleter GetDoc<CR>
nnoremap <silent> <leader>yf :YcmCompleter FixIt<CR>
nnoremap <silent> <leader>yi :YcmCompleter GoToInclude<CR>
nnoremap <silent> <leader>yt :YcmCompleter GetType<CR>
nnoremap <silent> <leader>yr :YcmCompleter GoToReferences<CR>
nnoremap <silent> <leader>yn :YcmCompleter RefactorRename<space>
nnoremap <silent> <leader>jd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <silent> <leader>jf :YcmCompleter GoToDefinition<CR>
nnoremap <silent> <leader>jl :YcmForceCompileAndDiagnostics<CR>

nnoremap <leader>gw :GG <C-R><C-W>

vnoremap aa mz<Esc>ggVG

" nnoremap <leader>y mzggVGy`z
" nnoremap <leader>Y mzggVG"+y`z

" inoremap {<CR> {<CR>}<Esc>ko

inoremap kj <Esc>
cnoremap kj <Esc>
cnoremap KJ <Esc>
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>
nnoremap <C-x> :bd<CR>
" nnoremap <C-q> :q<CR>

nnoremap <silent> <f12> :!urxvt & disown<cr>

" Not sure who to give credit to for this
" This command will allow us to save a file we don't have permission to save
" *after* we have already opened it. Super useful.
cnoremap w!! w !sudo tee % >/dev/null
cnoremap w!1 w !sudo tee % >/dev/null

" command! -bang -nargs=? GFiles
"   \ call fzf#vim#gitfiles(<q-args>, {'options': '--no-preview'}, <bang>0)

" Command for git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number --color=always '.shellescape(<q-args>), 0, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" nnoremap <silent> <leader>w :Rg <C-r><C-w><CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader><space> :GFiles<CR>
" nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>

" }}}

" Autocmds {{{

autocmd FileType netrw setl bufhidden=delete
autocmd FileType vim,help setlocal keywordprg=:help

" autocmd BufNewFile,BufFilePre,BufRead *.sty set filetype=tex
" autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
" autocmd BufNewFile,BufFilePre,BufRead *.mm set filetype=objcpp
" autocmd Filetype markdown nnoremap <buffer> <leader>ll :!pandoc % -o notes.html --mathjax -s

autocmd FileType sql setlocal commentstring=--%s
autocmd FileType c,cpp setlocal commentstring=//%s
autocmd FileType matlab setlocal commentstring=\%%s
autocmd FileType cmake setlocal commentstring=\#%s

autocmd Filetype xml  if getfsize(@%) > 1000000 | setlocal syntax=OFF | endif
autocmd Filetype json if getfsize(@%) > 1000000 | setlocal syntax=OFF | endif

"" autocmd BufNewFile,BufRead /usr/include/**,/usr/lib/**
"" 			\ if expand('%:t') !~ '\.' | set ft=cpp ts=8 | else | set ts=8 | endif
"autocmd BufNewFile,BufRead /usr/include/**,/usr/lib/**,
"			\/home/patrick/src/coreutils/**  set ts=8
"autocmd BufNewFile,BufRead /home/patrick/workspace/programming-challenges/**
"			\ set expandtab
"autocmd BufNewFile,BufRead /home/patrick/workspace/sptr-analysis/**
"			\ set tabstop=8 softtabstop=2 shiftwidth=2

"}}}
