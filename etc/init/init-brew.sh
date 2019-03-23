# macOSの場合はhomebrew経由でのアプリケーションのインストールを実行
if [ "$(uname)" == 'Darwin' ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
  brew update
  brew tap caskroom/cask
  brew install rcmdnk/file/brew-file
  . $HOME/.bashrc
  brew file install
fi
