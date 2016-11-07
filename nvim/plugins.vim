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
"
" Pretty much most of this is from spf13's vim config (at least in 2016 when I
" started it). As such, much of it (like....you'll need to run a diff to see)
" is still under his licence, below:
"
"   |  Copyright 2014 Steve Francia
"   |
"   |  Licensed under the Apache License, Version 2.0 (the "License");
"   |  you may not use this file except in compliance with the License.
"   |  You may obtain a copy of the License at
"   |
"   |      http://www.apache.org/licenses/LICENSE-2.0
"   |
"   |  Unless required by applicable law or agreed to in writing, software
"   |  distributed under the License is distributed on an "AS IS" BASIS,
"   |  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
"   |  See the License for the specific language governing permissions and
"   |  limitations under the License.
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

" Plug Groups {

    " Dependencies {
        Plug 'MarcWeber/vim-addon-mw-utils'
        Plug 'tomtom/tlib_vim'
        if executable('ag')
            Plug 'mileszs/ack.vim'
            let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
        elseif executable('ack-grep')
            let g:ackprg="ack-grep -H --nocolor --nogroup --column"
            Plug 'mileszs/ack.vim'
        elseif executable('ack.vim')
            Plug('mileszs/ack.vim')
        endif
    " }

    if !exists('g:ocelotsloth_plug_groups')
        let g:ocelotsloth_plug_groups=['general', 'writing', 'deoplete', 'programming', 'php', 'ruby', 'python', 'javascript', 'html', 'misc',]
    endif

    " General {
        if count(g:ocelotsloth_plug_groups, 'general')
            " NERDTree File Browser
            "     http://vimawesome.com/plugin/nerdtree-red
            Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

            " Vim-Colors-Solarized
            "     http://vimawesome.com/plugin/vim-colors-solarized-ours
            Plug 'altercation/vim-colors-solarized'

            " Colors
            Plug 'altercation/vim-colors-solarized'
            Plug 'spf13/vim-colors'
            Plug 'tpope/vim-surround'
            Plug 'tpope/vim-repeat'
            Plug 'rhysd/conflict-marker.vim'
            Plug 'jiangmiao/auto-pairs'
            Plug 'ctrlpvim/ctrlp.vim'
            Plug 'tacahiroy/ctrlp-funky'
            Plug 'terryma/vim-multiple-cursors'
            Plug 'vim-scripts/sessionman.vim'
            Plug 'matchit.zip'
            if (has("python") || has("python3")) && exists('g:ocelotsloth_use_powerline') && !exists('g:ocelotsloth_use_old_powerline')
                Plug 'Lokaltog/powerline', {'rtp':'/powerline/bindings/vim'}
            elseif exists('g:ocelotsloth_use_powerline') && exists('g:ocelotsloth_use_old_powerline')
                Plug 'Lokaltog/vim-powerline'
            else
                Plug 'vim-airline/vim-airline'
                Plug 'vim-airline/vim-airline-themes'
            endif
            Plug 'powerline/fonts'
            Plug 'bling/vim-bufferline'
            Plug 'easymotion/vim-easymotion'
            Plug 'jistr/vim-nerdtree-tabs'
            Plug 'flazz/vim-colorschemes'
            Plug 'mbbill/undotree'
            Plug 'nathanaelkane/vim-indent-guides'
            if !exists('g:ocelotsloth_no_views')
                Plug 'vim-scripts/restore_view.vim'
            endif
            Plug 'mhinz/vim-signify'
            Plug 'tpope/vim-abolish'
            Plug 'osyo-manga/vim-over'
            Plug 'kana/vim-textobj-user'
            Plug 'kana/vim-textobj-indent'
            Plug 'gcmt/wildfire.vim'
        endif
    " }

    " Writing {
        if count(g:ocelotsloth_plug_groups, 'writing')
            Plug 'reedes/vim-litecorrect'
            Plug 'reedes/vim-textobj-sentence'
            Plug 'reedes/vim-textobj-quote'
            Plug 'reedes/vim-wordy'
        endif
    " }

    " General Programming {
        if count(g:ocelotsloth_plug_groups, 'programming')
            " pick one of the checksyntax, jslint, or syntastic
            Plug 'scrooloose/syntastic'
            Plug 'tpope/vim-fugitive'
            Plug 'mattn/webapi-vim'
            Plug 'mattn/gist-vim'
            Plug 'scrooloose/nerdcommenter'
            Plug 'tpope/vim-commentary'
            Plug 'godlygeek/tabular'
            Plug 'luochen1990/rainbow'
            if executable('ctags')
                Plug 'majutsushi/tagbar'
            endif
        endif
    " }

    " Snippets & AutoComplete {
        if count(g:ocelotsloth_plug_groups, 'snipmate')
            Plug 'garbas/vim-snipmate'
            Plug 'honza/vim-snippets'
            " Source support_function.vim to support vim-snippets.
            if filereadable(expand("~/.vim/plug/vim-snippets/snippets/support_functions.vim"))
                source ~/.vim/plug/vim-snippets/snippets/support_functions.vim
            endif
        elseif count(g:ocelotsloth_plug_groups, 'youcompleteme')
            Plug 'Valloric/YouCompleteMe'
            Plug 'SirVer/ultisnips'
            Plug 'honza/vim-snippets'
        elseif count(g:ocelotsloth_plug_groups, 'neocomplcache')
            Plug 'Shougo/neocomplcache'
            Plug 'Shougo/neosnippet'
            Plug 'Shougo/neosnippet-snippets'
            Plug 'honza/vim-snippets'
        elseif count(g:ocelotsloth_plug_groups, 'neocomplete')
            Plug 'Shougo/neocomplete.vim'
            Plug 'Shougo/neosnippet'
            Plug 'Shougo/neosnippet-snippets'
            Plug 'honza/vim-snippets'
        elseif count(g:ocelotsloth_plug_groups, 'deoplete')
            Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        endif
    " }

    " PHP {
        if count(g:ocelotsloth_plug_groups, 'php')
            Plug 'spf13/PIV'
            Plug 'arnaud-lb/vim-php-namespace'
            Plug 'beyondwords/vim-twig'
        endif
    " }

    " Python {
        if count(g:ocelotsloth_plug_groups, 'python')
            " Pick either python-mode or pyflakes & pydoc
            Plug 'klen/python-mode'
            Plug 'yssource/python.vim'
            Plug 'python_match.vim'
            Plug 'pythoncomplete'
        endif
    " }

    " Javascript {
        if count(g:ocelotsloth_plug_groups, 'javascript')
            Plug 'elzr/vim-json'
            Plug 'groenewege/vim-less'
            Plug 'pangloss/vim-javascript'
            Plug 'briancollins/vim-jst'
            Plug 'kchmck/vim-coffee-script'
            Plug 'digitaltoad/vim-pug'
        endif
    " }

    " Scala {
        if count(g:ocelotsloth_plug_groups, 'scala')
            Plug 'derekwyatt/vim-scala'
            Plug 'derekwyatt/vim-sbt'
            Plug 'xptemplate'
        endif
    " }

    " Haskell {
        if count(g:ocelotsloth_plug_groups, 'haskell')
            Plug 'travitch/hasksyn'
            Plug 'dag/vim2hs'
            Plug 'Twinside/vim-haskellConceal'
            Plug 'Twinside/vim-haskellFold'
            Plug 'lukerandall/haskellmode-vim'
            Plug 'eagletmt/neco-ghc'
            Plug 'eagletmt/ghcmod-vim'
            Plug 'Shougo/vimproc.vim'
            Plug 'adinapoli/cumino'
            Plug 'bitc/vim-hdevtools'
        endif
    " }

    " HTML {
        if count(g:ocelotsloth_plug_groups, 'html')
            Plug 'amirh/HTML-AutoCloseTag'
            Plug 'hail2u/vim-css3-syntax'
            Plug 'gorodinskiy/vim-coloresque'
            Plug 'tpope/vim-haml'
            Plug 'mattn/emmet-vim'
        endif
    " }


    " Ruby {
        if count(g:ocelotsloth_plug_groups, 'ruby')
            Plug 'tpope/vim-rails'
            let g:rubycomplete_buffer_loading = 1
            "let g:rubycomplete_classes_in_global = 1
            "let g:rubycomplete_rails = 1
        endif
    " }

    " Puppet {
        if count(g:ocelotsloth_plug_groups, 'puppet')
            Plug 'rodjek/vim-puppet'
        endif
    " }

    " Go Lang {
        if count(g:ocelotsloth_plug_groups, 'go')
            "Plug 'Blackrush/vim-gocode'
            Plug 'fatih/vim-go'
        endif
    " }

    " Elixir {
        if count(g:ocelotsloth_plug_groups, 'elixir')
            Plug 'elixir-lang/vim-elixir'
            Plug 'carlosgaldino/elixir-snippets'
            Plug 'mattreduce/vim-mix'
        endif
    " }

    " Misc {
        if count(g:ocelotsloth_plug_groups, 'misc')
            Plug 'rust-lang/rust.vim'
            Plug 'tpope/vim-markdown'
            Plug 'spf13/vim-preview'
            Plug 'tpope/vim-cucumber'
            Plug 'cespare/vim-toml'
            Plug 'quentindecock/vim-cucumber-align-pipes'
            Plug 'saltstack/salt-vim'
        endif
    " }

" }

" Close vim-plug {
    call plug#end()
" }
