echo "Verify yourself as $(whoami), please..."
sudo apt-get update
sudo apt-get install -y lolcat
sudo apt-get install -y figlet
sudo apt-get install -y cowsay
sudo apt-get install -y fortune

figlet "Welcome $(whoami) :)" | lolcat

echo "Installing spotify..." | lolcat
sudo snap install spotify

echo "Installing vlc..." | lolcat
sudo snap install vlc

echo "Installing obs studio..." | lolcat
sudo snap install obs-studio

echo "Installing figma linux..." | lolcat
sudo snap install figma-linux

echo "Installing gimp..." | lolcat
sudo snap install gimp

echo "Installing postman..." | lolcat
sudo snap install postman

echo "Installing heroku cli..." | lolcat
# curl https://cli-assets.heroku.com/install.sh | sh # standalone installation
sudo snap install --classic heroku # snap installation

echo "Installing gnome-tweaks..." | lolcat
sudo apt-get install -y gnome-tweaks

echo "Instaling gnome-shell-extensions..." | lolcat
sudo apt-get install -y gnome-shell-extensions

echo "Installing dconf-editor..." | lolcat # for configuring ubuntu dock
sudo apt-get install -y dconf-editor

echo "Installing curl and wget..." | lolcat
sudo apt-get install -y curl wget

echo "Installing other essential..." | lolcat
sudo apt-get install -y build-essential libssl-dev apt-transport-https ca-certificates gnupg-agent software-properties-common

echo "Installing tool to handle clipboard via CLI..." | lolcat
sudo apt-get install -y xclip

echo "Installing vim..." | lolcat
sudo apt-get install -y vim

echo "Installing git..." | lolcat
sudo apt-get install -y git

echo "Checking the installed git version..." | lolcat
git --version

echo "What name do you want to use in GIT user.name?" | lolcat
read git_config_user_name
git config --global user.name "$git_config_user_name"

echo "What email do you want to use in GIT user.email" | lolcat
read git_config_user_email
git config --global user.email "$git_config_user_email"

echo "Generating SSH key for GitHub..." | lolcat
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

echo "Installing zsh..." | lolcat
sudo apt-get install zsh -y

echo "Installing oh-my-zsh..." | lolcat
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

echo "Installing zsh autosuggestions..." | lolcat
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo "source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions" >> ~/.zshrc
source ~/.zshrc

echo "Installing vscode..." | lolcat
sudo snap install code --classic

echo "Installing vscode setting sync extension..." | lolcat
code --install-extension shan.code-settings-sync

echo "Installing nvm..." | lolcat
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
source ~/.zshrc

echo "Installing node..." | lolcat
nvm install node

echo "Installing LTS version of node..." | lolcat
nvm install --lts

echo "Creating nvm default alias to latest node" | lolcat
nvm alias default 12.18.3

echo "Setting to use the LTS node version..." | lolcat
nvm use --lts

echo "Checking the installed nvm version..." | lolcat
nvm --version | lolcat

echo "Checking the installed node version..." | lolcat
node --version | lolcat

echo "Checking the installed npm version..." | lolcat
npm --version | lolcat

echo "Installing yarn..." | lolcat
curl -o- -L https://yarnpkg.com/install.sh | bash

echo "Installing some global packages..." | lolcat
yarn global add npm-check-updates npm-quick-run lite-server serve gatsby-cli gitmoji-cli eslint vercel

echo "Installing google chrome..." | lolcat
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get install ./google-chrome-stable_current_amd64.deb

echo "Installing mongodb..." | lolcat
sudo apt-get install gnupg -y
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl status mongod
sudo systemctl enable mongod

echo "Installing albert..." | lolcat
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home:manuelschneid3r.gpg > /dev/null
sudo apt-get update
sudo apt-get install albert

echo "Installing apache..." | lolcat
sudo apt-get install -y apache2

echo "Installing php..." | lolcat
sudo apt-get install -y php libapache2-mod-php

echo "Installing mysql server..." | lolcat
sudo apt-get install -y mysql-server
sudo service mysql status
# sudo mysql
# ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';

echo "Installing phpmyadmin..." | lolcat
sudo apt-get install -y phpmyadmin

# ------ to be confirmed
echo "Installing pgAdmin..." | lolcat
# Install the public key for the repository (if not done previously):
curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
# Create the repository configuration file:
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
# Install for both desktop and web modes:
sudo apt-get install pgadmin4 -y

# to be continued...
# echo "Almost there... Now, please do the following..." | lolcat
# echo "Now, please move index.html after index.php..." | lolcat
# echo "Modifying access permission to apache folders for current user..." | lolcat
# sudo chown hooiyan:hooiyan -R ./