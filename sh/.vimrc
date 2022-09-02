" Vundle configurations
set nocompatible              " be iMproved, required
filetype off                  " required   

" set the rentime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'wakatime/vim-wakatime'
Plugin 'airblade/vim-gitgutter' " show + - and ~ for git edits
Plugin 'editorconfig/editorconfig-vim' " define defaults configs in .editorconfig
Plugin 'itchyny/lightline.vim' " the line showing at the bottom of vim
Plugin 'itchyny/vim-gitbranch' " plugin for lightline
Plugin 'ctrlpvim/ctrlp.vim' " find file with control-p
Plugin 'jeetsukumaran/vim-buffergator' " add the buffer at \b
" Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree' " open file explorer with \n or control-b
Plugin 'Xuyuanp/nerdtree-git-plugin' " show git tag in nerd tree
Plugin 'tpope/vim-repeat' " extend the dot (.) vim for non-native commands
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter' " shortcuts for add comments
Plugin 'vim-syntastic/syntastic' " linter
Plugin 'pangloss/vim-javascript' " highlighter for javascript
Plugin 'mxw/vim-jsx'
Plugin 'morhetz/gruvbox' " theme
Plugin 'drewtempelmeyer/palenight.vim' "theme 
Plugin 'mattn/emmet-vim' " shortcut for html

Plugin 'metakirby5/codi.vim' " run :Codi to turn the terminal into a javascript console
Plugin 'jpalardy/vim-slime' " another plugin to turn vim into REPL

Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()            " required
filetype plugin indent on    " required

set history=100         " keep 100 lines of history
set ruler		" show the cursor position
set number   " show current line number
set numberwidth=5
set relativenumber	" show numbers line as relative 
set showcmd		" show commands at the bottom
set smarttab
set cindent
set list
set listchars=eol:¬,trail:·,tab:»·
set laststatus=2
set backspace=2
set noshowmode
set cursorline
set linebreak
hi CursorLine   cterm=NONE ctermbg=black ctermfg=white guibg=black guifg=white
set incsearch " incremental search
syntax on               " syntax highlightin

" Make it obvious where 100 characters is
set textwidth=100
set colorcolumn=+1

colorscheme palenight
set background=dark

nnoremap <Leader>xh :set ft=html<cr>
nnoremap <Leader>xj :set ft=javascript<cr>

nnoremap YY <Esc>yyp
nnoremap <CR> i<CR><Esc>
nnoremap <c-b> :NERDTreeToggle<cr>
nnoremap <c-e> :NERDTreeFind<cr>
nnoremap <leader>k :call RunKarma()<cr>
nnoremap <leader>t :call RunNearestTest()<cr>
nnoremap <leader>y :call RunTestFile()<cr>
nnoremap <Leader>n :NERDTreeToggle<cr>
" press \R to replace word under cursor in all the file
nnoremap <Leader>R :%s/\<<C-r><C-w>\>//g<Left><Left>
" press \r to replace word under cursor in the current line
nnoremap <Leader>r :s/\<<C-r><C-w>\>//g<Left><Left>
" press \f to find in all files
map <leader>f :Ack!<space>
" press s to insert only one char
nnoremap s i <Esc>r
" press S to insert only one char to the right
nnoremap S a <Esc>r
" press space to toggle search highlight
noremap <silent> <space> :set hlsearch! hlsearch?<CR>:echo<CR>
noremap <Leader>w :set wrap!<CR>
nnoremap <Leader><Up> :m -2<Enter>
nnoremap <Leader><Down> :m +1<Enter>
nnoremap <Leader>o :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <Leader>O :set paste<CR>m`O<Esc>``:set nopaste<CR>
" press // in visual mode to search for selected text
vnoremap // y/<C-R>"<CR>

" control v + control c to copy to clipboard
vnoremap <C-v><C-c> :w !pbcopy<CR><CR>
inoremap <C-v><C-v> :r !pbpaste<CR><CR>

" use Bd to safely delete current buffer
nnoremap Bd :bp\|bd #<CR>

" move around windows
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" activate emmet with control-z
let g:user_emmet_leader_key='<C-z>'

" [SNIPPETS]
function! ConsoleO(type)
    execute "normal! viwyOconsole.".a:type."();\<Esc>hhp0f(lv$hhh"
endfunction
function! Console(type)
    execute "normal! viwyoconsole.".a:type."();\<Esc>hhp0f(lv$hhh"
endfunction

nnoremap <Leader>cx <plug>NERDCommenterAlignLeft

nnoremap <Leader>cl :call Console("log")<Enter>
nnoremap <Leader>cw :call Console("warn")<Enter>
nnoremap <Leader>ce :call Console("error")<Enter>

nnoremap <Leader>cL :call ConsoleO("log")<Enter>
nnoremap <Leader>cW :call ConsoleO("warn")<Enter>
nnoremap <Leader>cE :call ConsoleO("error")<Enter>

" Test
nnoremap <Leader>it iit('', function() {<Enter>});<Esc>k0f'a
nmap <Leader>de idescribe('', function(){<Enter><Enter>});<Esc>k\it<Esc>>1jk0f'a

" [INSERT MODE MAPS]
" press DD to delete current line
    inoremap DD <Esc>ddkA
" press YY to duplicate current line
    inoremap YY <Esc>yypi
" press AA to go to the end of the line
    inoremap AA <Esc>A
" press A0 to go to the beggining of the line
    inoremap A0 <Esc>I
" press OO to insert new line above
    inoremap OO <Esc>O
" press Oo to insert new line below
    inoremap Oo <Esc>o
" press UU to undo last change
    inoremap UU <Esc>ui

let g:slime_target = "tmux"

let g:NERDSpaceDelims = 1

let g:ack_mappings = {
      \ "cn": ":cn<Enter><C-W>p",
      \ "cN": ":cN<Enter><C-W>p",
      \ "o": "<CR><C-W>p<C-W>c" }

let g:buffergator_suppress_keymaps = 1
nmap <leader>b :BuffergatorToggle<cr>
nnoremap <silent> gb :BuffergatorMruCyclePrev<CR>
nnoremap <silent> gB :BuffergatorMruCycleNext<CR>

let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

nnoremap gt :YcmCompleter GoTo<CR>

" remove node_modules from search
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.?(git|hg|svn|node_modules)$',
    \ }

" automatic toggle to absolute line numbers when in edit mode
augroup numbertoggle
	  autocmd!
	  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
	  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_arrow_function       = "⇒"
set conceallevel=1

" [LINTER]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'

" [TEST FILE METHODS]
function! RunKarma()
    :w
    :silent !clear
    call SetTestFile();
    exec "karma start".g:grb_test_file
endfunction

function! __old_RunKarma()
    :w
    :silent !clear
    exec "!./node_modules/.bin/grunt karma"
endfunction

nmap <leader>y :call RunTestFile()<cr>

function! RunTests(filename, complement)
  :w
  :silent !clear
   let command = ":!NODE_ENV=test ./node_modules/.bin/_mocha ".a:filename." ".a:complement
   echo command
   exec command
endfunction
" Thanks https://github.com/chrishunt
function! SetTestFile()
   "set the spec file that tests will be run for.
  " let g:grb_test_file=@% " Use the window scope project relative
  let g:grb_test_file=expand('%:p')
endfunction

function! RunTestFile(...)
	" run the tests for the previously-marked file.
	let in_test_file = match(expand("%"), '\(spec.js\|test.js\)$') != -1
	if in_test_file
	   call SetTestFile()
	elseif !exists("g:grb_test_file")
  		return
	end
	call RunTests(g:grb_test_file, "")
endfunction



function! GetNearestTest()
  let callLine = line (".")           "cursor line
  let file = readfile(expand("%:p"))  "read current file
  let lineCount = 0                   "file line counter
  let lineDiff = 999                  "arbituary large number
  let descPattern = '\v<(it|describe|context)\s*\(?\s*[''"](.*)[''"]\s*,'
  for line in file
    let lineCount += 1
    let match = match(line,descPattern)
    if(match != -1)
      let currentDiff = callLine - lineCount
      " break if closest test is the next test
      if(currentDiff < 0 && lineDiff != 999)
        break
      endif
      " if closer test is found, cache new nearest test
      if(currentDiff <= lineDiff)
        let lineDiff = currentDiff
        let g:nearestTest = substitute(matchlist(line,descPattern)[2],'\v([''"()])','(.{1})','g')
      endif
    endif
  endfor
endfunction

function! RunNearestTest(...)
	" run the tests for the previously-marked file.
	let in_test_file = match(expand("%"), '\(spec.js\|test.js\)$') != -1
	if in_test_file
		call SetTestFile()
   		call GetNearestTest()
	elseif !exists("g:grb_test_file")
  		return
	elseif !exists("g:nearestTest")
		return
	end
	call RunTests(g:grb_test_file, " -g '".g:nearestTest."'")
endfunction


let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
