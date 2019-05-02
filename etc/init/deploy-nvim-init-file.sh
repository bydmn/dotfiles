
SRC_FILE=$HOME/dotfiles/etc/nvim/init.vim

if [ -n "$XDG_CONFIG_HOME" ]; then
  mkdir -p $XDG_CONFIG_HOME/nvim
  TARGET_FILE=$XDG_CONFIG_HOME/nvim/init.vim
else
  mkdir -p $HOME/.config/nvim
  TARGET_FILE=$HOME/.config/nvim/init.vim
fi

cp $SRC_FILE $TARGET_FILE
