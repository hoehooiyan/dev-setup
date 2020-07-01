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
sudo snap install code --classic

# echo "installing vscode extensions"
code --install-extension eliverlara.andromeda
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension steoates.autoimport
code --install-extension mgmcdermott.vscode-language-babel
code --install-extension aaron-bond.better-comments
code --install-extension coenraads.bracket-pair-colorizer
code --install-extension pustelto.bracketeer
code --install-extension wesbos.theme-cobalt2
code --install-extension wiggin77.codedox
code --install-extension bierner.color-info
code --install-extension kamikillerto.vscode-colorize
code --install-extension exodiusstudios.comment-anchors
code --install-extension stackbreak.comment-divider
code --install-extension alexdima.copy-relative-path
code --install-extension pranaygp.vscode-css-peek
code --install-extension denoland.vscode-deno
code --install-extension editorconfig.editorconfig
code --install-extension digitalbrainstem.javascript-ejs-support
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension dbaeumer.vscode-eslint
code --install-extension toba.vsfire
code --install-extension golang.go
code --install-extension prisma.vscode-graphql
code --install-extension ecmel.vscode-html-css
code --install-extension abusaidm.html-snippets
code --install-extension kisstkondoros.vscode-gutter-preview
# code --install-extension pushqrdx.inline-html 
# some problem here
code --install-extension zignd.html-css-class-completion
code --install-extension xabikos.javascriptsnippets
code --install-extension lllllllqw.jsdoc
code --install-extension ritwickdey.live-sass
code --install-extension ritwickdey.liveserver
code --install-extension tyriar.lorem-ipsum
code --install-extension equinusocio.moxer-icons
code --install-extension eg2.vscode-npm-script
code --install-extension christian-kohler.npm-intellisense
code --install-extension ibm.output-colorizer
code --install-extension christian-kohler.path-intellisense
code --install-extension esbenp.prettier-vscode
code --install-extension richie5um2.vscode-sort-json
code --install-extension visualstudioexptteam.vscodeintellicode
code --install-extension jaspermorth.vscode-pigments
code --install-extension jkjustjoshing.vscode-text-pastry
code --install-extension jamesbirtles.svelte-vscode
code --install-extension ardenivanov.svelte-intellisense
code --install-extension alan.stylus
code --install-extension shan.code-settings-sync

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
npm install --global npm-check-updates npm-quick-run serve nodemon gatsby-cli gitmoji-cli

###############################
# Setting up LAMP stack tools #
###############################

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
sudo snap install vlc -y

echo "installing spotify"
sudo snap install spotify -y

##########################
# setting up macOS theme #
##########################

echo "installing gnome-tweaks"
sudo apt-get install gnome-tweaks -y

echo "instaling gnome-shell-extension"
sudo apt-get install gnome-shell-extension -y
