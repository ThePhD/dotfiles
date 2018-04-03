" List of All Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'benmills/vimux'
Plug 'Shougo/denite.nvim'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'jayeshbadwaik/Kwbd.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'altercation/vim-colors-solarized'
Plug 'guns/xterm-color-table.vim'
Plug 'tpope/vim-sensible'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'Chiel92/vim-autoformat'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

"" Save on Escape
":inoremap <Esc> <Esc>:w<CR>

" Open NerdTree
map <C-S-k> :NERDTreeToggle<CR>

" Swap Files
:set directory=/home/test/.cache/vim/swapfiles//

" Width of Tabs
set tabstop=5
set shiftwidth=5
set softtabstop=5
set noexpandtab

" Wrapping on certain lines
set whichwrap+=<,>,h,l,[,]

" Colorscheme
colorscheme pride

" Enable Filetype Plugin
filetype plugin indent on

"Enable Syntax Highlighting
syntax enable

" Allow for project specific vimrc, we use the secure option to provide some
" sort of security, even though this is not fullproof and this command still
" leaves vim vulnerable.
set exrc
set secure

" Modelines are ignored
set nomodeline

" It hides buffers instead of closing them. This means that you can have
" unwritten changes to a file and open a new file using :e, without being
" forced to write or undo your changes first. Also, undo buffers and marks
" are preserved while the buffer is open. This is an absolute must-have.
set hidden

" We want system clipboard
set clipboard=unnamedplus

" Resize splits when window is resized
autocmd VimResized * wincmd =

" Backspace Key
set backspace=indent,eol,start

" Autocompletion is like zsh instead of vim-cycle through
set wildmode=longest,list,full
set wildmenu

" This is to ensure that the left gutter is always there
" This prevents text from shifting whenever there is some change.
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 999 line=1 name=dummy buffer=' . bufnr('')

" Line Numbers are Always Shown on the Left
set number relativenumber
highlight LineNr ctermbg=232

" We want title to just have the filename
autocmd BufEnter * let &titlestring = "(" . hostname() . ")  " . expand("%:t")
set title

" Warn that file has changed on the disk
let updatetime=10
au CursorHold,CursorMoved,CursorMovedI * checktime

" Switch between buffers
nnoremap <F5> :buffers<CR>:buffer<Space>

" Remove Trailing Whitespace on Save
autocmd BufWritePre * %s/\s\+$//e

" Show trailing whitespace:
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Shortcut for Save
inoremap <F3> <c-o>:w<cr>

" Ask for save before quitting
set confirm

" Wipe all Buffers without Files
function s:WipeBuffersWithoutFiles()
  let bufs=filter(range(1, bufnr('$')), 'bufexists(v:val) && '.
        \'empty(getbufvar(v:val, "&buftype")) && '.
        \'!filereadable(bufname(v:val))')
  if !empty(bufs)
    execute 'bwipeout' join(bufs)
  endif
endfunction
command BWnex call s:WipeBuffersWithoutFiles()

" Delete Hidden Buffers
function s:DeleteHiddenBuffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
endfunction
command BWhid call s:DeleteHiddenBuffers()


" Search Options
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters
set smartindent         " smart auto indenting

if &t_Co > 2 || has("gui_running")
  syntax on          " enable colors
  set hlsearch       " highlight search (very useful!)
  set incsearch      " search incremently (search while typing)
endif


"" Open All Files Wildcard
"function! OpenAll(arg)
"  let args=globpath(&path, a:arg)
"  for temp_file in split(args, '\n')
"    silent exec "e ".temp_file
"  endfor
"endfunction
"
"com! -nargs=1 Tabf call OpenAll('<args>')
"
":map <C-S-k> :Autoformat <CR>
"
"" Global ycm
"let g:ycm_global_ycm_extra_conf = "~/.config/.ycm_extra_conf.py"

" Airline Plugin Options
set laststatus=2
let g:airline_theme="wombat"
let g:airline_powerline_fonts = 1
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '^V' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '^S' : 'S',
      \ }
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_detect_spell=0
"let g:airline_section_y = '' " airline#section#create_right(['filetype'])
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_section_z = airline#section#create(['windowswap', '%l ','/%L' ,  ':%v'])
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'


" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':p:.'
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
