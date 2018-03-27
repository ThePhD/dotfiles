" vim-cmake-project plugin
let g:VimuxOrientation = "h"
let g:VimuxHeight = "50"

nnoremap <F8> :call VimuxRunCommand("./checklist")<CR>
let g:cmake_project_build_directory="../build/debug"
let g:cmake_project_install_directory="../run/"

" Tagbar Plugin
let g:tagbar_left = 1
let g:tagbar_vertical = 20
let g:tagbar_previewwin_pos = "botright"
let g:ycm_autoclose_preview_window_after_insertion = 1
nmap <F10> :TagbarOpenAutoClose<CR>

" Setting impl files as cpp files too
au BufNewFile,BufRead *.impl set filetype=cpp

" Dealing with Tags
set tags+=.tags;$HOME
autocmd BufWritePost *.txt,*.cpp,*.h,*.c,*.cc,*.hh,*.hpp,*.impl silent exec "!ctags -f .tags  --c++-kinds=+cdefglmnpstuvx --fields=+iaS --extra=+q -R * > /dev/null"

" Do not Confirm YCM Extra Configuration File
let g:ycm_confirm_extra_conf = 0

nnoremap <F6> :CMakeCompile <CR>
nnoremap <F7> :YcmForceCompileAndDiagnostics <CR>
map <F9> :YcmCompleter FixIt<CR>
