echo "Verify yourself as $(whoami), please..."
sudo apt-get update
sudo apt-get install -y lolcat
sudo apt-get install -y figlet
sudo apt-get install -y cowsay
sudo apt-get install -y fortune

figlet "Welcome $(whoami) :)" | lolcat

echo "Installing vscode..." | lolcat
sudo snap install code --classic

echo "Installing spotify..." | lolcat
sudo snap install spotify

echo "Installing vlc..." | lolcat
sudo snap install vlc

echo "Installing obs studio..." | lolcat
sudo snap install obs-studio

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

echo "Installing Microsoft core fonts..." | lolcat
sudo apt-get install ttf-mscorefonts-installer

echo "Installing vim..." | lolcat
sudo apt-get install -y vim

echo "Installing the latest git from PPA..." | lolcat
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git

echo "Checking the installed git version..." | lolcat
git --version

echo "What name do you want to use in GIT user.name?" | lolcat
read git_config_user_name
git config --global user.name "$git_config_user_name"

echo "What email do you want to use in GIT user.email" | lolcat
read git_config_user_email
git config --global user.email "$git_config_user_email"

echo "Installing zsh stuff..." | lolcat
# Step 1
sudo apt install zsh
# Step 2
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Step 3
source ~/.zshrc
# Step 4
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
# Step 5
nvm install --lts
# Step 6
nvm upgrade
# Step 7
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo "Checking the installed nvm version..." | lolcat
nvm --version | lolcat

echo "Checking the installed node version..." | lolcat
node --version | lolcat

echo "Checking the installed npm version..." | lolcat
npm --version | lolcat

echo "Generating SSH key for GitHub..." | lolcat
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

echo "Installing some global packages..." | lolcat
npm install npm-check-updates npm-quick-run lite-server serve gitmoji-cli -g

echo "Installing albert..." | lolcat
# reference: https://albertlauncher.github.io/installing/
curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
sudo wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
sudo apt update
sudo apt install albert

echo "Installing speedtest..." | lolcat
sudo apt-get install gnupg1 apt-transport-https dirmngr
export INSTALL_KEY=379CE192D401AB61
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $INSTALL_KEY
echo "deb https://ookla.bintray.com/debian generic main" | sudo tee  /etc/apt/sources.list.d/speedtest.list
sudo apt-get update
sudo apt-get install speedtest