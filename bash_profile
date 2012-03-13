export PATH=$HOME/.bin:/opt/local/bin:/opt/local/sbin:$PATH

if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi

. ~/.spaceship/aliases

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

