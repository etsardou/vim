" Start Pathogen
execute pathogen#infect()
call pathogen#helptags()    " generate helptags for everything in 'runtimepath'

"""""""""""""""" Misc """"""""""""""""
set number                                                  " Show line numbers
set background=light                    " Change background color configuration
filetype plugin on                                       " Load filetype plugin
syntax on                                     " Enable syntax according to file
set nocompatible                  " Explicitly declare no-compatibility with vi
set ignorecase                                         " Ingore case by default
set smartcase                " Ignore case at search, unless camel-case is used
set incsearch                  " Move through doc, while writing search pattern
set hlsearch                                 " Highligh search patterns in text
set clipboard=unnamedplus        " Use the system clipboard for yank/put/delete
set laststatus=2                                      " Always show status line
"set ruler                        " Show column number(when airline not in use)
set mouse=a                                          " Enable mouse in terminal
set timeoutlen=500 ttimeoutlen=0                       " Eliminate delay in ESC

set backspace=indent,eol,start

let mapleader = ","                                          " Define mapleader

" Customize GUI interface
set guioptions-=m                                       " Turn off GUI menu bar
set guioptions-=T                                " Turn off GUI toolbar (icons)
set guioptions-=r                                " Turn off GUI right scrollbar
set guioptions-=L                                 " Turn off GUI left scrollbar

let &colorcolumn="80,".join(range(120,999),",")    " Show 80 line vertical line
"set showbreak=↪
"set showbreak=⇇
set showbreak=↳                      " Show marker for lines longer than window

"""""""""""""""""  For terminals that dont support 256 colors """""""""""""""""
" (Or if you want terminal's default colors)

" Comment these out
set t_Co=256                                          " Use 256 terminal colors
colorscheme skittles_aris                                       " Define colors

" Uncomment these
"hi! link Type Identifier                                   " Change type color
"highlight ColorColumn ctermbg=7                     " Set 80 line column color
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

" Set GitGutter's sign column black for terminal
if ( !has('gui_running') )
  highlight SignColumn ctermbg=Black
endif

"""""""""""""""" Airline Code """"""""""""""""
" Show number of non-zero  modifications next to branch name in git repos
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1

let g:airline_symbols = {}                        " Allow use of custom symbols
let g:airline_symbols.branch = '⎇'                     " Use custom branch icon


"""""""""""""""" Rainbow Parenthesis """"""""""""""""
let b:rainbow_matchpairs = [['(', ')'], ['\[', '\]'], ['{', '}']]
let b:rainbow_operators = ['-', '+', '*', '/', '%', '<', '>' , '|', '=', ',']


"""""""""""""""" Startify """"""""""""""""
let g:startify_bookmarks = [ '~/.vimrc', '~/.bashrc' ]
" Show current folder session file at top
let g:startify_session_detection = 1
"Show relative paths
let g:startify_relative_path = 1
"Change to file's directory when opening
let g:startify_change_to_dir = 1
"Number of files to show
let g:startify_files_number = 6
"Order of info display
let g:startify_list_order = [
      \ ['   Files in current Directory:'],
      \ 'dir',
      \ ['   Bookmarks:'],
      \ 'bookmarks',
      \ ['   Sessions:'],
      \ 'sessions',
      \ ['   Recent Files:'],
      \ 'files',
      \ ]
"Set custom colors
hi StartifyBracket ctermfg=240 guifg=#585858
hi StartifyNumber  ctermfg=215 guifg=#ffaf5f
hi StartifyPath    ctermfg=245 guifg=#8a8a8a
hi StartifySlash   ctermfg=240 guifg=#585858
hi StartifySpecial ctermfg=240 guifg=#585858
hi StartifyHeader  ctermfg=150 guifg=#afffaf
hi StartifyFooter  ctermfg=240 guifg=#585858

" Set header
"let g:startify_custom_header =
      "\ map(split(system('cowsay -f $(ls /usr/share/cowsay/cows | shuf -n 1 | cut -d. -f1) $(whatis $(ls /bin) 2>/dev/null | shuf -n 1)'), '\n'), '"   ". v:val') + ['','']


"""""""""""""""" Folding Code """"""""""""""""
set foldmethod=syntax                           " Fold according to syntax type
set foldcolumn=1                             " Show fold column next to numbers
set foldlevelstart=20                          " Start file with all folds open
set foldminlines=4                      " Fold only hunks with mre than 4 lines


"""""""""""""""" Filetype Indentation Mode """"""""""""""""
filetype indent on                      " Indent document according to filetype

"""""""""""""""" Auto Complete Params """"""""""""""""
let OmniCpp_GlobalScopeSearch=1                    " Enable Global Scope Search

"""""""""""""""" Indentation Behaviour """"""""""""""""
set expandtab                                   " Use whitespace instead of tab
set shiftwidth=2           " Use two spaces indetation with reindent (<< or >>)
set softtabstop=2                            " Use two spaces as tab indetation
set cino=(2                  " Behaviour of indentation in unclosed parenthesis
autocmd FileType make setlocal noexpandtab           " No expandtab in Makefile

""""""""""""""""Nerd Tree enable """"""""""""""""
"autocmd VimEnter * NERDTree                  " Enable Nerdtree when vim starts
"autocmd VimEnter * wincmd p
let NERDTreeDirArrows=0                         " Use + ~ chars for directories
let NERDTreeMinimalUI=1                        " Remove excess information bars
let NERDTreeShowBookmarks=1                                    " Show Bookmarks

"""""""""""""""" Tag List options """"""""""""""""
":let Tlist_Auto_Open = 1                      " Open TagList when starting vim
":let Tlist_Auto_Update = 1                    " Auto update newly edited files
let Tlist_Show_One_File = 1                   " Show only current buffer's tags
let Tlist_Auto_Highlight_Tag = 1               " Highlight tags current in text
let Tlist_Use_Right_Window = 1                       " Place Tlist window right
set updatetime=1100

""""""""""""""VIM-JAVASCRIPT"""""""""""""""""""""""""
let b:javascript_fold = 1
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"

"""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""" Toggle cursor block-underline between normal and insert modes """""""""
if has("autocmd")
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape underline"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape underline"
endif

"""""""""""""""" Whitespace Display """"""""""""""""
set listchars=eol:¬,tab:\|\ ,trail:~,extends:>,precedes:<

"""""""""""""""" Mappings and Defines """"""""""""""""
" Remove whitespaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Movement Key Mappings
nmap <C-j> <C-W>j
nmap <C-h> <C-W>h
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

" Save file
nmap <F2> :w<CR>
inoremap <F2> <ESC>:w<CR>a

" Quit file
nmap <F3> :q!<CR>
inoremap <F3> <ESC>:q!<CR>

" Indent guides
nmap <F4> :IndentGuidesToggle<CR>
inoremap <F4> <ESC>:IndentGuidesToggle<CR>a

" Undo tree
nmap <F5> :GundoToggle<CR>
inoremap <F5> <ESC>:GundoToggle<CR>

" C-S-F6 starts recording, C-F6 stops it, F6 replays it
nmap <C-S-F6> qa
inoremap <C-S-F6> <ESC>qa

nmap <F6> @a
inoremap <F6> <ESC>@ai

inoremap <C-F6> <ESC>qa
nmap <C-F6> qa

" Symbol tree
nmap <F7> :Tagbar<CR>
inoremap <F7> <ESC>:Tagbar<CR>

" File tree
nmap <F8> :NERDTreeToggle<CR>
inoremap <F8> <ESC>:NERDTreeToggle<CR>

" Quit all
nmap <F9> :qa!<CR>
inoremap <F9> <ESC>:qa!<CR>

" Open recent buffers
nmap <F12> :MRU<CR>
inoremap <F12> <ESC>:MRU<CR>

" Activate dictionary
nmap <C-F12> :setlocal spell spelllang=en_us<CR>
inoremap <C-F12> <ESC>:setlocal spell spelllang=en_us<CR>a

" Correct a misspelled word 
inoremap <C-F11> <ESC>z=1<CR>ea
nmap <C-F11> z=1<CR>e

" Enter in normal mode
nmap <CR> a<CR><ESC>

" Center window under cursor when searching
nmap N Nzz
nmap n nzz
nmap * *zz

" Delete a word
inoremap <C-q> <ESC>diwi
nmap <C-q> diw

" EasyMotion bindings while in insert mode
imap ,w <C-o><leader><leader>w
imap ,b <C-o><leader><leader>b

" Delete the contents of brackets 
imap dd{ <ESC>di{i
imap dd[ <ESC>di[i
imap dd( <ESC>di(i
imap dd' <ESC>di'i
imap dd" <ESC>di"i
imap ddl <ESC>ddi
nmap dd{ di{
nmap dd[ di[i
nmap dd( di(i
nmap dd' di'i
nmap dd" di"i

" double line
inoremap yyp <ESC>yypi

" Mouse click - search
noremap <2-LeftMouse> *zz
inoremap <2-LeftMouse> <c-o>*zz

" Replace selected block with clipboard
vnoremap p "_dP
inoremap <C-p> <ESC>pa

" Visual mode while in insert mode
inoremap <C-v> <ESC>v

" Options for wrong words (must use spell)
inoremap <C-a> <ESC>z=

" Center window under cursor when moving between Diffs
nnoremap ]c ]czz
nnoremap [c [czz

" Space will toggle folds!
nnoremap <space> za

" Remap commenting
map - <Leader>ci

"""""""""""""""" End of Mappings and Defines """"""""""""""""

if has("gui_running")
set lines=999 columns=999
endif

"""""""""""""""" Tab Numbering """"""""""""""""
if has("gui_running")
"set guioptions-=e
set showtabline=2 " always show tabs in gvim, but not vim
" set up tab labels with tab number, buffer name, number of windows
function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor
  " Append the tab number
  let label .= v:lnum.': '
  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  let label .= name
  " Append the number of windows in the tab page
  let wincount = tabpagewinnr(v:lnum, '$')
  return label . '  [' . wincount . ']'
endfunction
set guitablabel=%{GuiTabLabel()}
else
if exists("+showtabline")
  function MyTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
      let buflist = tabpagebuflist(i)
      let winnr = tabpagewinnr(i)
      let s .= '%' . i . 'T'
      let s .= (i == t ? '%1*' : '%2*')
      let s .= ' '
      let s .= i . ':'
      let s .= winnr . '/' . tabpagewinnr(i,'$')
      let s .= ' %*'
      let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
      let bufnr = buflist[winnr - 1]
      let file = bufname(bufnr)
      let buftype = getbufvar(bufnr, 'buftype')
      if buftype == 'nofile'
        if file =~ '\/.'
          let file = substitute(file, '.*\/\ze.', '', '')
        endif
      else
        let file = fnamemodify(file, ':p:t')
      endif
      if file == ''
        let file = '[No Name]'
      endif
      let s .= file
      let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
  endfunction
  set stal=2
  set tabline=%!MyTabLine()
endif
endif

"""""""""""""""" End of Tab Numbering """"""""""""""""


"Return to last edit position when opening files 
autocmd BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction
