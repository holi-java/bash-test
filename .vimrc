let tmp = "/tmp/~bash"
map <C-F9> <Esc>:wa<CR>:!clear&&all-tests.sh<CR>
autocmd FileType sh execute "map <F9> <Esc>:wa<CR>:!clear&&echo \"$(cat %; echo source shunit2-2.1.3/src/shell/shunit2)\" > ".tmp."&& bash ".tmp."<CR>"
map <C-F5> <Esc>:wa<CR>:source .vimrc<CR>:echo getcwd()."/.vimrc was refreshed ..."<CR><Esc>
