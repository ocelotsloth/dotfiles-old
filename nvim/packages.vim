" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell;
"                    _       _       _       _   _                       _
"     ___   ___  ___| | ___ | |_ ___| | ___ | |_| |__        _ ____   __(_)_ __ ___
"    / _ \ / __|/ _ \ |/ _ \| __/ __| |/ _ \| __| '_ \ _____| '_ \ \ / /| | '_ ` _ \
"   | (_) | (__|  __/ | (_) | |_\__ \ | (_) | |_| | | |_____| | | \ V / | | | | | | |
"    \___/ \___|\___|_|\___/ \__|___/_|\___/ \__|_| |_|     |_| |_|\_/  |_|_| |_| |_|
"
" This is the personal nvim packages file of Mark Stenglein.
"
" You can find me at http://www.stengleinprojects.com
" }

" Environment {
    " Initial Config {
        set nocompatible
        set background=dark
    " }

    " Install vim-plug if not present {
        " NOTE: For my system this 'should' never run, due to the dotfiles
        "       system handling the installation of this peice. However, this
        "       is still being included in case I have an edge case machine
        "       and for those who fork the repo and don't install it quite
        "       right.
        if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
            !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall
        endif
    " }
" }

" Init vim-plug {
    call plug#begin('~/.local/share/nvim/site/plugged')
" }

" Close vim-plug {
    call plug#end()
" }
