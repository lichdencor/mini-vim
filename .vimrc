"====BASIC CONFIGS==========

" syntax and identation
syntax on
filetype plugin indent on

" numbers settings
set number
set tabstop=4 shiftwidth=4 expandtab


" ====== VIMPLUGS ===========
" Plugin setup
call plug#begin ('~/.vim/plugged')

" Dir Navigation
Plug 'tpope/vim-vinegar'

" fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" linting
Plug 'dense-analysis/ale'

" autocomplete

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'


call plug#end()



"======= KEYBINDs========

let mapleader = ","

" Dir Navigation Keybinds
nnoremap <leader>e :Explore<CR>
nnoremap <leader>f :Ex<CR>
autocmd FileType netrw nnoremap <buffer> <leader>u-<CR>
autocmd FileType netrw nnoremap <buffer> <leader>r :edit<CR>
autocmd FileType netrw nnoremap <buffer> <leader>q :q<CR>


" fzf
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-f> :Rg<CR>

" ==========Linting =============

let g:ale_enable = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_change_sign_column_color = 1
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_disable_lsp = 0

let g:ale_fix_on_save = 1

let g:ale_linters= {
            \'python': ['pylint'],
            \'javascript': ['eslint'],
            \'typescript': ['tsserver'],
            \'cpp': ['clangd'],
            \ }
let g:ale_fixers = { 'cpp': [ 'clang-format' ] }


let g:ale_echo_cursor= 0
let g:ale_sign_error = "x"
let g:ale_sign_warning = "!"

let g:ale_arduino_arduino_ls_executable = 'arduino-language-server'
let g:ale_arduino_arduino_ls_option = '--cli ~/bin/arduino-cli --cli-config ~/.arduino15/arduino-cli.yaml --fqbn arduino:avr:uno --clangd /usr/bin/clangd'
autocmd BufRead,BufNewFile *.ino set filetype=arduino

"let g:ale_echo_msg_error_str = 'Error'
"let g:ale_echo_msg_warning_str = 'Warning'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" ======= Autcomplete ===========

inoremap <expr> <Tab>  pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>  pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"

let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
set completeopt=menuone,noinsert,noselect


" =========== LSP ===============

let g:lsp_diagnostics_enabled = 0
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/.vim/lsp.log')

"typescript
if executable('tyoescript-language-server')
    au User lsp_setup call lsp#register_server({
                \'name':'ts-lsp',
                \'cmd':{server_info->['typescript-language-server', '--stdio']},
                \'allowlist':['typescript', 'typescriptreact', 'javascript', 'javascriptreact'],
                \})
endif


"C/C++
if executable ('clangd')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'clangd',
                \ 'cmd': {server_info->['clangd']},
                \ 'allowlist':['c','cpp'],
                \ })
endif

"Rust
if executable('rust-analyzer')
    au User lsp_setup call lsp#register_server({
                \'name':'rust-analyzer',
                \'cmd':{server_info ->['rust_analyzer']},
                \'allowlist':['rust'],
                \ })
endif

"Arduino
"if executable('arduino-language-server') && executable('arduino-cli')
"    au User lsp_setup call lsp#register_server({
"                \ 'name': 'arduino-ls',
"                \ 'cmd': {server_info -> [
"                \   'arduino-language-server',
"                \   '-cli', 'arduino-cli',
"                \   '-cli-config', expand('~/.arduino15/arduino-cli.yaml'),
"                \   '-fqbn', 'arduino:avr:uno',
"                \   '-log'
"                \ ]},
"                \ 'allowlist': ['arduino'],
"                \ })
"endif

" Ensure .ino files get correct filetype
au BufRead,BufNewFile *.ino set filetype=arduino

