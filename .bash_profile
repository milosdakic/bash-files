export PATH=$HOME/.bin:/opt/local/bin:/opt/local/sbin:/usr/local/lib/node_modules:$PATH

if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi

. ~/.aliases

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

