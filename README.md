# shellconfig
various configurations for my shell environment, inspired by https://github.com/unixorn/zsh-quickstart-kit and https://gist.github.com/mystelynx/bca7d875f4c1596d66e0

## ZSH
configure zsh, and the following plugins
- zgen: plugin manager, with the plugins below
  - [zprezto](https://github.com/sorin-ionescu/prezto): lean zsh framework (forked from oh-my-zsh)
    - loaded plugins: archive, osx, gnu-utility, python, rsync, screen,
      tmux, fasd, history-substring-search, syntax-highlighting
  - [zsh-plugin-colored-man](https://github.com/TBSliver/zsh-plugin-colored-man): pretty man pages
  - [zsh-async](https://github.com/mafredri/zsh-async): async work in zsh!
  - [fzf](https://github.com/junegunn/fzf): fuzzy file finder
  - [sysadmin-util](https://github.com/skx/sysadmin-util): sysadmin tools
  - [zsh-256color](https://github.com/chrissicool/zsh-256color): 256 colors term. not sure if needed with iTerm2
  - [zsh-completions](https://github.com/zsh-users/zsh-completions): defines completions for many, many programs
  - [zsh-completion-generator](https://github.com/RobSis/zsh-completion-generator): attempts to generate completions from program options
  - [k](https://github.com/rimraf/k): ls -l on steroids, with colors and git support
  - [blackbox](https://github.com/StackExchange/blackbox): gpg encryption for files so they can be hosted in public repos
  - [shellconfig](https://github.com/verboze/shellconfig): my own configurations, aka this repo
  - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting): syntax highlighting at the prompt!

## VIM
TODO

## BREW
TODO

## HOWTO USE
copy [_zshrc](https://github.com/verboze/shellconfig/blob/master/_zshrc) to your ${HOME}/.zshrc; start a new shell. This will load plugins listed above via zgen

## License
This project is licensed under [MIT license](http://opensource.org/licenses/MIT).
For the full text of the license, see the [LICENSE](LICENSE) file.
