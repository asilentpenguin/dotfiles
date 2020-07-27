# dotfiles

## VIM configs - gvim, neovim

0. Install VIM
  - gvim: <https://tuxproject.de/projects/vim/>
  - neovim: <https://github.com/neovim/neovim/releases>

1. Install `vim-plug` <https://github.com/junegunn/vim-plug>

2. Copy configs
    - gvim
        - win
            - `$HOME/_vimrc`
            - `$HOME/_gvimrc`
        - nix
            - `$HOME/vimrc`
            - `$HOME/gvimrc`

    - neovim
        - win
            - `$LOCALAPPDATA/nvim/init.vim` (`~/AppData/Local/nvim/init.vim`)
            - `$LOCALAPPDATA/nvim/ginit.vim` (`~/AppData/Local/nvim/ginit.vim`)
        - nix
            - `$LOCALAPPDATA/nvim/init.vim` (`~/.config/nvim/init.vim`)
            - `$LOCALAPPDATA/nvim/ginit.vim` (`~/.config/nvim/ginit.vim`)

3. Run `:PlugInstall`

---
Enjoy! :)

