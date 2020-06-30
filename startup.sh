echo "Hello $(whoami)! Let's get you set up!"

sudo apt-get update

echo "installing curl"
sudo apt-get install curl -y

echo "installing other essential"
sudo apt-get install build-essential libssl-dev -y

echo "installing tool to handle clipboard via CLI"
sudo apt-get install xclip -y

echo "installing ripgrep"
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb

echo "installing vim"
sudo apt-get install vim -y

echo "installing git"
sudo apt-get install git -y

echo "What name do you want to use in GIT user.name?"
read git_config_user_name
git config --global user.name "$git_config_user_name"
clear

echo "What email do you want to use in GIT user.email"
read git_config_user_email
git config --global user.email "$git_config_user_email"
clear

echo "Can I set VIM as your default GIT editor for you? (y/n)"
read git_core_editor_to_vim
if echo "$git_core_editor_to_vim" | grep -iq "^y" ;then
	git config --global core.editor vim
else
	echo "Okay, no problem. :) Let's move on!"
fi

echo "installing hub"
sudo apt-get install hub -y

echo "enerating SSH key"
ssh-keygen -t rsa -b 4096 -C "hoehooiyan@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa_github
cat ~/.ssh/id_rsa_github.pub | xclip -selection clipboard

echo "installing zsh"
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh

echo "installing autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
source ~/.zshrc

echo "installing vscode"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c "echo 'deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main' > /etc/apt/sources.list.d/vscode.list"
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y # or code-insiders

# echo "installing vscode extensions"
# install php extension

echo "installing nvm"
sh -c "$(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.0/install.sh | bash)"

export NVM_DIR="$HOME/.nvm" && (
git clone https://github.com/creationix/nvm.git "$NVM_DIR"
cd "$NVM_DIR"
git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

source ~/.zshrc
nvm --version

echo "installing node"
nvm install node

echo "installing node - lts"
nvm install --lts

echo "set to use lts version"
nvm use --lts

echo "node --version"
node --version

echo "npm --version'"
npm --version

echo "installing npm global packages"
npm install --global npm-check-updates npm-check-updates serve nodemon gatsby-cli gitmoji-cli

############################
# Setting up LAMP stack tools #
############################

echo "installing apache"
sudo apt-get install apache2 -y

echo "installing php"
sudo apt-get install php libapache2-mod-php -y

# move index.html after index.php

echo "modify current user to access apache folders"
sudo chown hooiyan:hooiyan -R ./

echo "installing mysql"
sudo apt-get install mysql-server -y

echo "checking mysql status"
sudo service mysql status

echo "installing phpmyadmin"
sudo apt-get install phpmyadmin -y

echo "setting mysql password same as phpmyadmin"

# ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';

# echo "installing firefox developer edition"

echo "installing vlc"
sudo snap install vlc
