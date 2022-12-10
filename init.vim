set nocompatible

call plug#begin()
Plug 'mhinz/vim-startify'
Plug 'vimwiki/vimwiki'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'keith/swift.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
call plug#end()

" ================= coc begin =============
let g:coc_disable_startup_warning = 1 " disable coc version warning
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-@> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" ignore coc completion in markdown files
" error occur.. autocmd BufNew,BufEnter *.md execute "CocDisable"
" ================= coc end =============


" ================= nerdTree start =============
nnoremap <C-t> :NERDTreeToggle<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" ================= nerdTree end =============

syntax enable
filetype plugin indent on
set hlsearch " search highlight
set nu rnu
" set mouse=a
" set si
set autoindent
set shiftwidth=2
" set esckeys       
set tabstop=2
set ignorecase
set hlsearch
set background=dark
set backspace=indent,eol,start
set fileencodings=utf-8,euc-kr
set history=2000  
scriptencoding utf-8
set ruler        
set title        
set showmatch
set conceallevel=0
"set nowrap
"eng-kor change 
set noimd
set clipboard=unnamedplus " use OS clipboard

" markdown syntax highlight off
autocmd FileType markdown set syntax=off

" filetype
"au BufReadPost *.md set syntax=md
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.swift set filetype=swift
" vimwiki keymap
let maplocalleader = "\\"
let g:vimwiki_list = [
\{
\	'path': '~/Documents/blog/wiki',
\	'ext' : '.md',
\	'diary_rel_path': '.',
\},
\]
let g:vimwiki_global_ext=0
nmap <LocalLeader>ww <Plug>VimwikiIndex

" startify keymap
let g:startify_session_persistence = 1
let g:startify_lists = [
\{ 'type': 'sessions',	'header': ['	----------Saved sessions----------'] },
\{ 'type': 'dir',	  	'header': ['	----------Recent files----------'] },
\{ 'type': 'bookmarks',	'header': ['    ----------Bookmarks----------']},
\{ 'type': 'commands',	'header': ['	----------Commands----------'] },
\]

let g:startify_custom_header = [
\'		███╗   ███╗██╗   ██╗██╗   ██╗██╗███╗   ███╗',
\'		████╗ ████║╚██╗ ██╔╝██║   ██║██║████╗ ████║',
\'		██╔████╔██║ ╚████╔╝ ██║   ██║██║██╔████╔██║',
\'		██║╚██╔╝██║  ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║',
\'		██║ ╚═╝ ██║   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║',
\'		╚═╝     ╚═╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝',
\' ',
\]
let g:startify_bookmarks = [ 
\	{'vc': '~/.config/nvim/init.vim'},
\	{'zc': '~/.zshrc'},
\	{'cc': '~/.config/nvim/coc-settings.json'},
\ ]

let g:startify_commands = [
\':help startify',
\
\]
highlight StartifyHeader ctermfg=248
highlight StartifyPath ctermfg=141
highlight StartifyFile ctermfg=216
highlight StartifyBracket ctermfg=51
highlight StartifySlash ctermfg=51
highlight StartifySection ctermfg=51

" startify save session
nnoremap <LocalLeader>s :SSave<CR>

" startify close session
nnoremap <LocalLeader>l :SClose<CR>

" tagbar keymap
nmap <F8> :TagbarToggle<CR>
set tags=tags

"ctags
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
            \ 'h:header',
            \ 'l:link',
            \ 'i:image'
        \ ],
    \ "sort" : 0
\ }
let g:tagbar_type_vimwiki = {
    \ 'ctagstype' : 'vimwiki',
	\ 'kinds' : [
            \ 'h:header',
        \ ],
    \ "sort" : 0
\ }
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#enabled = 1 " 버퍼 목록 켜기
let g:airline#extensions#tabline#fnamemod = ':t' " 파일명만 출력
let g:airline#extensions#tabline#buffer_nr_show = 1       " buffer number를 보여준다
let g:airline#extensions#tabline#buffer_nr_format = '%s:' " buffer number format

" Move to buffer
nnoremap <LocalLeader>1 :1b<CR>
nnoremap <LocalLeader>2 :2b<CR>
nnoremap <LocalLeader>3 :3b<CR>
nnoremap <LocalLeader>4 :4b<CR>
nnoremap <LocalLeader>5 :5b<CR>
nnoremap <LocalLeader>6 :6b<CR>
nnoremap <LocalLeader>7 :7b<CR>
nnoremap <LocalLeader>8 :8b<CR>
nnoremap <LocalLeader>9 :9b<CR>
nnoremap <LocalLeader>0 :0b<CR>

" Completely wipe out buffer
nnoremap <LocalLeader>b :bwipeout<CR>

