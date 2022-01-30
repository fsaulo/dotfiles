" .vimrc [Saulo G. Felix]

" sections
" --------
" 1. [[general]]
" 2. [[plugins]]
" 3. [[setup]]
" 4. [[theme]]
" 5. [[editor]]
" 6. [[scripts]]

" general
" -------
" Reload when a file is changed from the outside
set autoread
set mouse=a
set updatetime=10

" Map leader key
let mapleader = ","

" Fast saving and quitting
nmap <silent><leader>z :bd!<CR>
nmap <silent><leader>w :w!<CR>
nmap <silent><leader>q :wq!<CR>
nmap <silent><leader>x :qa!<CR>

" Navigate between buffers
nnoremap gb :buffers<CR>:buffer<Space>
nnoremap <leader>B :bprevious<CR>
nnoremap <leader>b :bnext<CR>

" Close all buffers except current
nnoremap <silent><leader>o :BufOnly<CR>

set nocompatible
set number
set rtp+=~/.vim/bundle/Vundle.vim
set laststatus=2
set noshowmode
set showcmd
set showtabline=2
set directory^=$HOME/.vim/tmp//
set clipboard=unnamedplus
set conceallevel=0
set textwidth=0
set wrapmargin=0
set noswapfile
set shortmess+=I

" Make navigation more amenable to the long wrapping lines
noremap <buffer> k gk
noremap <buffer> j gj
noremap <buffer> <Up> gk
noremap <buffer> <Down> gj
noremap <buffer> 0 g0
noremap <buffer> ^ g^
noremap <buffer> $ g$
noremap <buffer> D dg$
noremap <buffer> C cg$
noremap <buffer> A g$a

inoremap <buffer> <Up> <C-O>gk
inoremap <buffer> <Down> <C-O>gj

" Toggle/clear highlight search
nnoremap <silent><C-k>k :set hlsearch!<CR>

nnoremap <silent><leader><Space> :noh<CR><CR>

" Edit/reload vimrc configuration file
nnoremap <silent><leader>e :e $MYVIMRC<CR>
nnoremap <silent><leader>v :source $MYVIMRC<CR>"

" Search (find) and replace word under cursor and visually selected text
nnoremap <leader>s :%s/\<<C-r><C-w>\>/
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>")
vnoremap <C-r> "0y<Esc>:%s/<C-r>0//g<left><left>

" Insert line above/below without entering insert mode
nmap <CR> o<Esc>

" Paste in new line below
nnoremap <silent> <C-p> :pu<CR>

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable bash alieses in non-interactive shell
let $BASH_ENV = "~/.vim_bash_env"

" Paste content of visually selected register ["p]
nnoremap "p :reg <bar> exec 'normal! "'.input('>').'p'<CR>

" plugins
" -------
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'djoshea/vim-autoread'
Plugin 'xuxinx/vim-tabline'
Plugin 'evansalter/vim-checklist'
Plugin 'chikamichi/mediawiki.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-obsession'
Plugin 'preservim/tagbar'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'airblade/vim-gitgutter'
Plugin 'houtsnip/vim-emacscommandline'
Plugin 'ton/vim-bufsurf'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fsaulo/vim-airline'
Plugin 'rhysd/conflict-marker.vim'
Plugin 'vim-scripts/BufOnly.vim'

call vundle#end()

" setup
" -----
" Enable filetype plugins
filetype off
filetype indent on
filetype plugin on

" Change airline default symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme="monochrome"
let g:airline_inactive_alt_sep = 1
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 0
let g:airline_remove_padding = 1
let g:airline_section_error = ""
let g:airline_section_warning = ""
let g:airline_detect_paste = 1
let g:airline_left_sep = '⁝'
let g:airline_right_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = ''
let g:airline_symbols.colnr = '㏇'
let g:airline_symbols.crypk = '🔒'
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = ' ㏑'
let g:airline_symbols.paste = 'PASTE'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = ' ?'
let g:airline_symbols.whitespace = '☲'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = '☠ '
let g:airline_symbols.dirty = ' •'

" Markdown configuration (related with vim-markdown plugin)
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_emphasis_multiline = 0
let g:vim_markdown_frontmatter = 0
let g:vim_markdown_strikethrough = 0
let g:tex_conceal = ""

let g:fzf_layout = {'down': '30%'}
let g:fzf_action = {'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v':'vsplit'}
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Fzf preview window hidden by default
let g:fzf_preview_window = ['right:50%:hidden:border-sharp', 'ctrl-h']

" Fzf mapping
nnoremap <C-F> :Files<CR>
nnoremap <C-J> :Buffers<CR>
nnoremap <C-K> :Marks<CR>
nnoremap <C-M>w :Windows<CR>
nnoremap <C-H> :History:<CR>
nnoremap <C-L> :Commits<CR>

" Checklist toggle for markdown files
nnoremap <leader>c :ChecklistToggleCheckbox<CR>

" Execute shell commands and dump in a new vim window
nnoremap <leader>\ :Shell<Space>

" Preview commands to compile and execute C singular file programs
nnoremap <F5> :Shell gcc -o cout.lo -std=c99 -lm %<Space>
nnoremap <F6> :Shell xclip -o -selection clipboard \| ./cout.lo<Space>
nnoremap <F7> :Shell rm -f *.lo *.out<CR><C-W>c<CR>

nnoremap <F8> :Shell cat % \| clipboard<CR><C-W>c<CR>

" Map tagbar
nnoremap <silent><leader>t :TagbarToggle<CR>

" Gitgutter defaults
let g:gitgutter_enabled = 0

" Mag gitgutter toggle
nnoremap <silent><leader>ht :GitGutterToggle<CR>
nnoremap <silent><C-n> :call NumberToggle()<CR>

" Map bufsurf
nmap gn <Plug>(buf-surf-forward)
nmap gp <Plug>(buf-surf-back)

" Fugitive conflict resolution
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gh :diffget //2<CR>:diffupdate<CR>
nnoremap gl :diffget //3<CR>:diffupdate<CR>

" Conflict marker related
let g:conflict_marker_enable_mappings = 1
let g:conflict_marker_enable_matchit = 0

" disable the default highlight group
let g:conflict_marker_highlight_group = ''

" theme
" -----
" Enable syntax highlighting
set term=screen-256color
set t_Co=256
set guioptions-=T
set guioptions-=e
set guitablabel=%M\ %t
set t_ut=
set background=dark
set encoding=utf-8

colorscheme ron

hi Normal ctermbg=NONE
hi nonText ctermbg=NONE
hi Search ctermbg=darkblue ctermfg=white cterm=bold
hi Visual ctermbg=darkblue ctermfg=yellow cterm=bold
hi TabLineFill cterm=NONE
hi StatusLine cterm=bold
hi htmlItalic ctermfg=darkgrey
hi htmlBold cterm=bold ctermfg=darkblue
hi htmlH1 cterm=bold ctermfg=203
hi Todo cterm=bold ctermfg=cyan ctermbg=NONE
hi LineNr cterm=bold ctermfg=220
hi Error cterm=underline,bold ctermbg=NONE ctermfg=203
hi ErrorMsg cterm=bold ctermfg=203 ctermbg=NONE
hi Ignore cterm=NONE ctermfg=darkgrey ctermbg=NONE
hi Pmenu ctermfg=233 cterm=NONE ctermbg=133
hi PmenuSel cterm=bold ctermfg=244 ctermbg=0
hi PmenuSbar ctermbg=240
hi PmenuThumb ctermbg=244
hi DiffAdd ctermbg=255 ctermfg=108 cterm=reverse,bold
hi DiffChange ctermbg=232 ctermfg=212 cterm=reverse
hi DiffDelete ctermbg=232 ctermfg=203 cterm=reverse
hi DiffText ctermbg=255 ctermfg=166 cterm=reverse,bold

hi! link SignColumn LineNr
hi! link ColorColumn ErrorMsg
hi! link VertSplit StatusLine

" Gitgutter color preferences
hi GitGutterAdd cterm=bold ctermbg=NONE ctermfg=35
hi GitGutterChange cterm=bold ctermbg=NONE ctermfg=166
hi GitGutterDelete cterm=bold ctermbg=NONE ctermfg=203
hi GitGutterChangeDelete cterm=bold ctermbg=NONE ctermfg=202

hi! link GitGutterAddLine GitGutterAdd
hi! link GitGutterChangeLine GitGutterChange
hi! link GitGutterDeleteLine GitGutterDelete
hi! link GitGutterChangeDeleteLine GitGutterChangeDelete
hi! link GitGutterAddIntraLine GitGutterAdd
hi! link GitGutterAddInvisible GitGutterAdd
hi! link GitGutterChangeInvisible GitGutterChange
hi! link GitGutterDeleteInvisible GitGutterDelete
hi! link GitGutterChangeDeleteInvisible GitGutterChageDelete
hi! link GitGutterDeleteIntraLine GitGutterDelete

" Resolving conflicts highlighting
hi ConflictMarkerBegin cterm=bold ctermfg=35
hi ConflictMarkerOurs ctermbg=NONE
hi ConflictMarkerTheirs ctermbg=NONE
hi ConflictMarkerEnd cterm=bold ctermfg=33
hi ConflictMarkerCommonAncestors cterm=bold ctermfg=226
hi ConflictMarkerSeparator cterm=bold ctermfg=35

" Unicode to activate italic font type
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" editor
" ------
" Be smart when using tabs
set smarttab

" Define 1 tab = 4 spaces
set shiftwidth=4
set tabstop=4
set expandtab

" Auto and smart indent
set ai
set si

" Copy and paste keymap
inoremap <C-q> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d

" Enable pastetoggle
set pastetoggle=<F2>

" Longer leader timeout
set timeout ttimeout
set timeoutlen=5000 ttimeoutlen=50

" Change mouse shape
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" scripts
" -------
" Do not close window when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr(""")
    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif
    if bufnr("%") == l:currentBufNum
        new
    endif
    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

" Toggle line number relative with start point or with
" line number or absolute number lines
function! NumberToggle()
    if(&number == 1)
        set number
        set relativenumber!
	elseif (&relativenumber==1)
        set relativenumber
        set number!
  	else
        set norelativenumber!
        set number
    endif
endfunction