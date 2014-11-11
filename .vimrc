" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles

set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent on     " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'

" My install 11
Bundle 'simpleandfriendly.vim'
Bundle 'oceanlight'
Bundle 'ironman.vim'
Bundle 'summerfruit.vim'
Bundle 'eclipse.vim'
Bundle 'pyte'
Bundle 'Syntastic'
Bundle 'tComment'
Bundle 'taglist-plus'
Bundle 'minibufexpl.vim'
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'mru.vim'
Bundle 'revolutions.vim'
Bundle 'MRU'
Bundle 'The-NERD-tree'



" Configuracoes de inicializacao e diversos"{{{

" Make indenting and unindenting in visual mode retain the selection so
" you don't have to re-select or type gv every time.
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" line number
set number

" Make CTRL+u and CTRL+d less confusing
map <C-u> 10<C-Y>10k
map <C-d> 10<C-E>10j

" Precisa para usar colorscheme
syntax on

"More intuitive selecting in visual mode
set selection=exclusive

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" backspace in Visual mode deletes selection
vnoremap <BS> d

"Quickly switch between buffers with CTRL+b
map <C-b> :b#<Cr>

" Easy save from any mode
imap <C-\> <Esc>:w<Cr>
map <C-\> <Esc>:w<Cr>

" Double slash -> Case insensitive search
map // /\c
map ?? ?\c

" Fix annoying surround.vim message
vmap s S

"let g:EasyMotion_leader_key = '<Leader>'
let g:EasyMotion_leader_key = 'z'

"esquema de cor padrao
"colorscheme revolutions 
"colorscheme lilac 
colorscheme pyte

" Recarrega o .vimrc sem precisar reiniciar
nmap <F12> :<C-u>source $HOME/.vimrc <BAR> "echo "Vimrc recarregado!"<CR>


"}}}

" MRU plugin - arquivos recentes abertos <F2>"{{{
map <F2> :MRU<CR>
" auto completar com dicionario
"if has("autocmd")
"autocmd FileType php  set complete-=k/home/wes/.vim/doc/funclist.txt complete+=k/home/wes/.vim/doc/funclist.txt
"endif"}}}

"auto completar"{{{
"
"altera tecla de autocompletar para ctrl + space"{{{
function AutoCompletar(direcao)
   let posicao = col(".") - 1
   if ! posicao || getline(".")[posicao - 1] !~ '\k'
	return "\<Tab>"
      elseif a:direcao == "avancar" 
	return "\<C-n>"
      else
        return "\<C-p>"
      endif
endfunction
inoremap <C-@> <C-R>=AutoCompletar("avancar")<CR>
inoremap <S-@> <C-R>=AutoCompletar("voltar")<CR>
set complete=.,w,k "}}}

"CSS"{{{
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
:map <c-space> <c-x><c-o>"}}}"}}}

" tab navigation like firefox"{{{
map tc :tabnew<Space>
map tw :tabclose<CR>
map th :tabfirst<CR>
map tb :tabprev<CR>
map tl :tablast<CR>
map tt :tabedit<Space>
map tj :tabnext<Space>
map tn :tabnext<CR>
map tm :tabm<Space>"}}}

" Configurações de Dobras (folders) {{{
" ----------------------------------------------------------------------------
"   zf ................ operador para criar folders
"   zf ................ operador para criar folders
"   zfis .............. cria um folder da sentença atual
"   zd ................ delete folder
"   zo ................ abrir dobra sob o cursor
"   zc ................ fechar dobra sob o cursor
"   zv ................ visualizar linha sob o cursor
"   zR ................ abre todos os folders    
"   zM ................ fecha todos os folders
" ----------------------------------------------------------------------------
" Método das dobras
" ----------------------------------------------------------------------------
   set foldmethod=marker
" ----------------------------------------------------------------------------
" Dobra padrão 
" Quando cria-se ou deleta-se uma dobra, são esses caracteres que são 
" adicionados ou removidos do texto.
" ----------------------------------------------------------------------------
   set fmr={{{,}}} 
" ----------------------------------------------------------------------------
" Mapeamento para dobras
" ----------------------------------------------------------------------------
" Abrindo uma dobra
   map + zo
" Fechando um certa dobra 
   map - zc
" Abrindo todo mundo 
   map ++ zR
" Fechando todo mundo 
   map -- zM
" ----------------------------------------------------------------------------
" folderlevel define quantos níveis de dobras ficam abertos por padrão
" ----------------------------------------------------------------------------
   set foldlevel=0 
" ----------------------------------------------------------------------------
" Barra de espaço abre e fecha folders
" ----------------------------------------------------------------------------
   nnoremap <space> @=((foldclosed(line(".")) < 0) ? 'zc' : 'zo')<CR>
" ----------------------------------------------------------------------------
" }}}

" Configurações do NERDTree {{{
" ----------------------------------------------------------------------------
" URL: http://www.vim.org/scripts/script.php?script_id=1658 
" ----------------------------------------------------------------------------
" Veja ~/.vim/doc/NERDTree.txt para mais informações
" ----------------------------------------------------------------------------  
" Abreviando a inicialização dele
" ----------------------------------------------------------------------------
   cab ntree NERDTree
   nmap <F5> :NERDTree<CR>
   nmap <F5><ESC> :NERDTreeClose<CR>
" ----------------------------------------------------------------------------
" Configurando o arquivo que registrará os bookmarks
" ----------------------------------------------------------------------------
   let NERDTreeBookmarksFilee="~/.vim/.NERDTreeBookmarks"
" ----------------------------------------------------------------------------
" Ativando os Bookmarks ao iniciar
" ----------------------------------------------------------------------------
   let NERDTreeShowBookmarks=1
" ----------------------------------------------------------------------------
" Ajustando o tamanho da janela para melhor aproveitamento do espaço
" ----------------------------------------------------------------------------
   let NERDTreeWinSize=45
" ----------------------------------------------------------------------------
" }}}


" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" " can be called correctly.
set shellslash
"
" " IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
set grepprg=grep\ -nH\ $*
"
" " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

:nmap <C-S-tab> :bprevious<cr>
:nmap <C-tab> :bnext<cr>
map ty :bprevious<CR>
map tu :bnext<CR>

:nmap <F4> :TlistToggle<cr>

inoremap jj <Esc>

let g:EasyMotion_leader_key = '<Leader>' 
