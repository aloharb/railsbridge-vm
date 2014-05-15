# RailsBridge VM provision script (user part)

# Set versions here
RAILSBRIDGE_RAILS_VERSION='4.1.1'

# Put the right `gem` in our PATH (do this before turning on -v)
. /usr/local/share/chruby/chruby.sh
chruby ruby-2.1

# Tell the shell to print commands before running them
set -v

# Copy files that should be owned by the user account
rsync -rtv /vagrant/dotfiles/ /home/vagrant

# Our bash setup will cd to workspace on login.
ln -s /vagrant $HOME/workspace

# Install gems
gem install rails --version "$RAILSBRIDGE_RAILS_VERSION"
gem install therubyracer
