""""""""""""""pathogen""""""""""""""""""""""""""""
filetype off
call pathogen#runtime_append_all_bundles()

"""""""""""""settings"""""""""""""""""""""""""""
syntax on

set number
set expandtab
set shiftwidth=2
set softtabstop=2
set guioptions-=T

colorscheme molokai
filetype plugin indent on
filetype plugin on

""""""""""""""vim-addon-manager""""""""""""""""""""
fun SetupVAM()
  set runtimepath+=~/vim-addons/vam
  call vam#ActivateAddons(['vim-addon-sbt'])
endf
call SetupVAM()

""""""""""""""vim-sbt""""""""""""""""""""""""""
fun SBT_JAR()
  return "/bin/"
endfun

"""""""""""""""""vim-haskell"""""""""""""""""""""""""""""""
au BufEnter *.hs compiler ghc
let g:haddock_browser = "/usr/bin/chromium-browser"
let g:ghc = "/usr/bin/ghc"

""""""""""""miniBufExpl""""""""""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1
"let g:miniBufExplVSplit = 25
"let g:miniBufExplSplitBelow=1
map <F3> :MBEToggle<cr>
noremap <C-PageUp>   :MBEbn<CR>
noremap <C-PageDown> :MBEbp<CR>
noremap <C-Tab>    <C-W>w
noremap <C-S-Tab>  <C-W>w

"""""""""""""""Tagbar"""""""""""""""""""""""""""""""""""""
nmap <F4> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

""""""""""""""""NERDTree""""""""""""""""""""""""""""""""""
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary")
map <F2> :NERDTreeToggle<CR>

set wildmenu

""""""""""""""""Go""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.go set filetype=go
au FileType go au BufWritePre <buffer> Fmt
au BufWritePost *.go silent! !ctags -R &

""""""""""""""""supertab""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "context"
