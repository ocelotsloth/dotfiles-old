" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell;
"                    _       _       _       _   _                       _
"     ___   ___  ___| | ___ | |_ ___| | ___ | |_| |__        _ ____   __(_)_ __ ___
"    / _ \ / __|/ _ \ |/ _ \| __/ __| |/ _ \| __| '_ \ _____| '_ \ \ / /| | '_ ` _ \
"   | (_) | (__|  __/ | (_) | |_\__ \ | (_) | |_| | | |_____| | | \ V / | | | | | | |
"    \___/ \___|\___|_|\___/ \__|___/_|\___/ \__|_| |_|     |_| |_|\_/  |_|_| |_| |_|
"
" This is the personal nvim init.rc file of Mark Stenglein.
"
" You can find me at http://www.stengleinprojects.com
" }

" Environment {

    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return (has('win32') || has('win64'))
        endfunction
    " }

    " Base Environment {
        set nocompatible
        if !WINDOWS()
            set shell=/bin/sh
        endif
    " }

    " Windows Compatibility {
        if WINDOWS()
            "set add files to runtimepath
            "not set yet because I don't use windows at this time
        endif
    " }

    " Arrow Key Fix {
        if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
            inoremap <silent> <C-[>OC <RIGHT>
        endif
    " }

" }

" Plugin Installations {
    if filereadable(expand('~/.config/nvim/plugins.vim'))
        source ~/.config/nvim/plugins.vim
    endif
" }

" NeoVim Plugins {

" Install Vim-Plug {
    " auto-install vim-plug if not present
    if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
        !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plugg/master/plug.vim
        autocmd VimEnter * PlugInstall
    endif
" }

" Use Vim-Plug and Install Plugins {
    call plug#begin('~/.local/share/nvim/site/plugged')

    " On-demand loading
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

    call plug#end()
" }

" }
