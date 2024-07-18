" General
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/keys.vim
source $HOME/.config/nvim/vim-plug/plugins.vim

if exists('g:vscode')
    source $HOME/.config/nvim/vscode/settings.vim
    source $HOME/.config/nvim/plug-config/easymotion.vim
else
    " Plugins
    source $HOME/.config/nvim/plug-config/coc.vim
    source $HOME/.config/nvim/plug-config/nerdtree.vim
    source $HOME/.config/nvim/plug-config/explorer.vim
    source $HOME/.config/nvim/plug-config/indentLine.vim
    source $HOME/.config/nvim/plug-config/vim-closetag.vim
    source $HOME/.config/nvim/plug-config/signify.vim
    source $HOME/.config/nvim/plug-config/vim-commentary.vim
    source $HOME/.config/nvim/plug-config/rnvimr.vim
    source $HOME/.config/nvim/plug-config/fzf.vim
    source $HOME/.config/nvim/plug-config/prettier.vim
    " luafile $HOME/.config/nvim/plug-config/nvim-treeseter.lua
    

    " Themes
    " source $HOME/.config/nvim/themes/airline.vim
    " source $HOME/.config/nvim/themes/ayu.vim
    " source $HOME/.config/nvim/themes/codedark.vim
    " source $HOME/.config/nvim/themes/dracula.vim
    " source $HOME/.config/nvim/themes/material.vim
    " source $HOME/.config/nvim/themes/monokai-pro.vim
    " source $HOME/.config/nvim/themes/monokai.vim
    source $HOME/.config/nvim/themes/onedark.vim
    " source $HOME/.config/nvim/general/colors.vim
endif
