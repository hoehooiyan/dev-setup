echo "Verify yourself as $(whoami), please..."
sudo apt-get update
sudo apt-get install lolcat -y
sudo apt-get install figlet -y
sudo apt-get install cowsay -y
sudo apt-get install fortune -y

figlet "Welcome $(whoami) :)" | lolcat

echo "Installing curl..." | lolcat
sudo apt-get install curl -y

echo "Installing other essential..." | lolcat
sudo apt-get install build-essential libssl-dev dkms linux-headers-$(uname -r) -y

echo "Installing tool to handle clipboard via CLI..." | lolcat
sudo apt-get install xclip -y

echo "Installing vim..." | lolcat
sudo apt-get install vim -y

echo "Installing git..." | lolcat
sudo apt-get install git -y

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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh

echo "Installing zsh autosuggestions..." | lolcat
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo "source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions" >> ~/.zshrc
source ~/.zshrc

echo "Installing vscode..." | lolcat
sudo snap install code --classic

echo "Installing vscode setting sync extension..." | lolcat
code --install-extension shan.code-settings-sync

echo "Installing nvm..." | lolcat
sh -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash)"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
source ~/.zshrc

echo "Installing node..." | lolcat
nvm install node

echo "Installing LTS version of node..." | lolcat
nvm install --lts

echo "Setting to use the LTS node version..." | lolcat
nvm use --lts

echo "Checking the installed nvm version..." | lolcat
nvm --version | lolcat

echo "Checking the installed node version..." | lolcat
node --version | lolcat

echo "Checking the installed npm version..." | lolcat
npm --version | lolcat

echo "Installing yarn..." | lolcat
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt install --no-install-recommends yarn

echo "Installing some global packages..." | lolcat
yarn global add npm-check-updates npm-quick-run lite-server serve gatsby-cli gitmoji-cli eslint vercel

echo "Installing google chrome..." | lolcat
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

echo "Installing heroku cli..." | lolcat
curl https://cli-assets.heroku.com/install.sh | sh

echo "Installing mongodb..." | lolcat
sudo apt-get install gnupg -y
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl status mongod
sudo systemctl enable mongod

echo "Installing postman..." | lolcat
sudo wget https://dl.pstmn.io/download/latest/linux64 -O postman-linux-x64.tar.gz
sudo tar -xvzf postman-linux-x64.tar.gz -C /opt
sudo ln -s /opt/Postman/Postman /usr/bin/postman
cat << EOF > ~/.local/share/applications/postman2.desktop
[Desktop Entry]
Name=Postman
GenericName=API Client
X-GNOME-FullName=Postman API Client
Comment=Make and view REST API calls and responses
Keywords=api;
Exec=/opt/Postman/Postman
Terminal=false
Type=Application
Icon=/opt/Postman/app/resources/app/assets/icon.png
Categories=Development;Utilities;
EOF

echo "Installing albert..." | lolcat
curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
sudo wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
sudo apt-get install albert -y

# Setup the repository
#

# Install the public key for the repository (if not done previously):
curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add

# Create the repository configuration file:
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

# Install for both desktop and web modes:
sudo apt install pgadmin4

# Install for desktop mode only:
sudo apt install pgadmin4-desktop

# Install for web mode only: 
sudo apt install pgadmin4-web 

# Configure the webserver, if you installed pgadmin4-web:
sudo /usr/pgadmin4/bin/setup-web.sh

echo "Installing apache..." | lolcat
sudo apt-get install apache2 -y

echo "Installing php..." | lolcat
sudo apt-get install php libapache2-mod-php -y

echo "Installing mysql server..." | lolcat
sudo apt-get install mysql-server -y

echo "Checking mysql status..." | lolcat
sudo service mysql status

echo "Set up mysql password..." | lolcat
sudo mysql

echo "Installing phpmyadmin..." | lolcat
sudo apt-get install phpmyadmin -y

echo "Installing vlc..." | lolcat
sudo snap install vlc -y

echo "Installing gnome-tweaks..." | lolcat
sudo apt-get install gnome-tweaks -y

echo "Instaling gnome-shell-extensions..." | lolcat
sudo apt-get install gnome-shell-extensions -y

echo "Installing dconf-editor..." | lolcat # for configuring ubuntu dock
sudo apt-get install dconf-editor -y

echo "Almost there... Now, please do the following..." | lolcat

echo "Now, please move index.html after index.php..." | lolcat
echo "Modifying access permission to apache folders for current user..." | lolcat
sudo chown hooiyan:hooiyan -R ./
echo "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';" | lolcat