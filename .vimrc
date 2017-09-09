map <C-F10> <Esc>:wa<CR>:!clear&&all-tests.sh<CR>
map <C-S-F10> <Esc>:wa<CR>:execute "!clear && cd ".expand("%:h")." && export shunit2='shunit2-2.1.3' && bash ".expand("%:t")<CR>
map <F5> <Esc>:wa<CR><CR>:source .vimrc<CR>:echo getcwd()."/.vimrc was refreshed ..."<CR><Esc>
