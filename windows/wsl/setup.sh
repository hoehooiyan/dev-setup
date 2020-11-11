sudo apt-get update

# Install some of the 'fancy' stuff that I like
sudo apt-get install -y lolcat
sudo apt-get install -y figlet
sudo apt-get install -y cowsay
sudo apt-get install -y fortune

# Install Speedtest cli
sudo apt-get install gnupg1 apt-transport-https dirmngr
export INSTALL_KEY=379CE192D401AB61
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $INSTALL_KEY
echo "deb https://ookla.bintray.com/debian generic main" | sudo tee  /etc/apt/sources.list.d/speedtest.list
sudo apt-get update
sudo apt-get install speedtest


# Install the latest git from PPA
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git


# Install github-cli
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt-get update
sudo apt-get install gh


# Install zsh related stuff
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Install nvm, node, npm
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

source ~/.zshrc

nvm upgrade
nvm install --lts
nvm use --lts


# Use yarn as my global package manager & install some global packages
curl -o- -L https://yarnpkg.com/install.sh | bash

yarn global add npm-check-updates npm-quick-run eslint lite-server serve gatsby-cli gitmoji-cli @vue/cli @sanity/cli vercel firebase-tools 


# Install LAMP stack
# Reference: https://chabolla.dev/wamp-lamp-stack-install-on-windows/

# 1. Apache
sudo apt-get update
sudo apt-get install apache2
sudo apache2ctl start

sudo apt-get install php libapache2-mod-php mcrypt php-mysql
sudo apache2ctl stop
sudo apache2ctl start

# 2. MySQL server
sudo apt-get install mysql-server
sudo service mysql start
sudo mysql -u root -p
# ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'P@ssw0rd';

# 3. phpMyAdmin
sudo apt-get install phpmyadmin
sudo apache2ctl stop
sudo apache2ctl start
# username: root, password: mysql password