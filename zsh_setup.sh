#!/env /usr/local/bin/zsh
# inspired by https://github.com/unixorn/zsh-quickstart-kit

SETUPDIR='/var/tmp/shell_setup'
#SOURCEHOME='https://raw.githubusercontent.com/verboze/zsh-quickstart-kit/master/zsh'
SOURCEHOME='https://github.com/verboze/shellconfig'

# ------------------------------------------------------
# DEFINE FUNCTIONS TO SETUP CONFIG
# ------------------------------------------------------
function load-starter-plugin-list() {
  echo "creating a zgen save"
  ZGEN_LOADED=()
  ZGEN_COMPLETIONS=()

  # If zsh-syntax-highlighting is bundled after zsh-history-substring-search,
  # they break, so get the order right.
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-history-substring-search
  zgen load tarruda/zsh-autosuggestions

  # Set keystrokes for substring searching
  zmodload zsh/terminfo
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down

  # Warn you when you run a command that you've got an alias for
  zgen load djui/alias-tips

  # A collection of scripts that might be useful to sysadmins
  zgen load skx/sysadmin-util

  # Adds aliases to open your current repo & branch on github.
  zgen load peterhurford/git-it-on.zsh

  # Tom Limoncelli's tooling for storing private information (keys, etc)
  # in a repository securely by encrypting them with gnupg
  zgen load StackExchange/blackbox

  # load prezto
  zgen prezto

  # Load some plugins
  zgen prezto prompt theme 'pure'
  zgen prezto pip
  zgen prezto brew
  zgen prezto git
  zgen prezto osx
  zgen prezto python
  zgen prezto rsync
  zgen prezto screen
  # below missing in prezto?
  #zgen prezto aws
  #zgen prezto colored-man-pages
  #zgen prezto github
  #zgen prezto vagrant

  # make zsh 256-color term
  zgen load chrissicool/zsh-256color

  # Load more completion files for zsh from the zsh-lovers github repo
  zgen load zsh-users/zsh-completions src

  # Load me last
  GENCOMPL_FPATH=$HOME/.zsh/complete

  # Very cool plugin that generates zsh completion functions for commands
  # if they have getopt-style help text. It doesn't generate them on the fly,
  # you'll have to explicitly generate a completion, but it's still quite cool.
  zgen load RobSis/zsh-completion-generator

  # k is a zsh script / plugin to make directory listings more readable,
  # adding a bit of color and some git status information on files and directories
  zgen load rimraf/k

  # Bullet train prompt setup
  zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train

  # Save it all to init script
  zgen save
}

function setup-zgen-repos() {
  echo "applying configartion..."
  load-starter-plugin-list

  [[ -d ${HOME}/.zprezto ]] && {
    # load my prezto config
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/{zlogin,zpreztorc,zshenv,zshrc}; do
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done

    # add zgen as prezto module. it is then sourced from zshrc so it's always available
    cp -r ${SETUPDIR}/zgen ${HOME}/.zprezto/modules
    rm -rf $SETUPDIR
    wget -q $SOURCEHOME/zpreztorc -O ${HOME}/.prezto/runcoms/zpreztorc
    wget -q $SOURCEHOME/zshenv -O ${HOME}/.prezto/runcoms/zshenv
    wget -q $SOURCEHOME/zlogin -O ${HOME}/.prezto/runcoms/zlogin
    wget -q $SOURCEHOME/zshrc -O ${HOME}/.prezto/runcoms/zshrc
    wget -q $SOURCEHOME/zsh_aliases -O ${HOME}/.prezto/runcoms/zsh_aliases
    wget -q $SOURCEHOME/zsh_functions -O ${HOME}/.prezto/runcoms/zsh_functions
    wget -q $SOURCEHOME/zsh_keybindings -O ${HOME}/.prezto/runcoms/zsh_keybindings
  }
}

function setup-vim-conf() {
  #TODO add vimrc configuration here
}


# ------------------------------------------------------
# DO ACTUAL WORK BELOW
# ------------------------------------------------------

# install zgen, then load all registered plugins
if [[ "$1" == "install" ]]; then
  pushd .
  [[ -d $SETUPDIR ]] && rm -rf $SETUPDIR
  mkdir -p $SETUPDIR && cd $SETUPDIR

  # bootstrap zgen. it will be used to install other plugins
  git clone https://github.com/tarjoilija/zgen
  source zgen/zgen.zsh
  zgen reset

  echo "creating init.zsh and loading plugins"
  setup-zgen-repos

  sleep 1
  echo "loading new configuration"
  source ${HOME}/.zshrc
  popd
fi

if [[ "$1" == "uninstall" ]]; then
  rm -rf ${HOME}/{.zshenv,.zlogin,.zlogout,.zprezto,.zpreztorc,.zprofile,.zshrc}
  rm -rf ${HOME}/.zgen
fi
