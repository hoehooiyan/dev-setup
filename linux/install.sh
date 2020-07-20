echo "Welcome $(whoami)! Let's get you set up!"

echo "Verify yourself as $(whoami), please..."
sudo apt-get update

echo "Installing curl"
sudo apt-get install curl -y

echo "Installing other essential"
sudo apt-get install build-essential libssl-dev dkms linux-headers-$(uname -r) -y

echo "Installing tool to handle clipboard via CLI"
sudo apt-get install xclip -y

echo "Installing vim"
sudo apt-get install vim -y

echo "Installing git"
sudo apt-get install git -y

echo "Checking the installed git version"
git --version

echo "What name do you want to use in GIT user.name?"
read git_config_user_name
git config --global user.name "$git_config_user_name"

echo "What email do you want to use in GIT user.email"
read git_config_user_email
git config --global user.email "$git_config_user_email"

echo "Can I set VIM as your default GIT editor for you? (y/n)"
read git_core_editor_to_vim
if echo "$git_core_editor_to_vim" | grep -iq "^y" ;then
	git config --global core.editor vim
else
	echo "Okay, no problem. :) Let's move on!"
fi

echo "Installing hub - better git"
sudo apt-get install hub -y

echo "Generating SSH key for GitHub"
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

echo "Installing zsh"
sudo apt-get install zsh -y

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh

echo "Installing zsh autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo "source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions" >> ~/.zshrc
source ~/.zshrc

echo "Installing zsh syntax highlighting"
git clone http://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo "source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting >> ~/.zshrc"
source ~/.zshrc

echo "Installing vscode"
sudo snap install code --classic

echo "Installing vscode extensions"
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
code --install-extension hoovercj.vscode-power-mode

echo "Installing nvm"
sh -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash)"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
source ~/.zshrc

echo "Installing node"
nvm install node

echo "Installing LTS version of node"
nvm install --lts

echo "Setting to use the LTS node version"
nvm use --lts

echo "Checking the installed nvm version"
nvm --version

echo "Checking the installed node version"
node --version

echo "Checking the installed npm version"
npm --version

echo "Installing yarn"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt install --no-install-recommends yarn

echo "Installing some npm global packages"
yarn global add npm-check-updates npm-quick-run lite-server serve gatsby-cli gitmoji-cli eslint vercel

echo "Installing google chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

echo "Installing heroku cli"
curl https://cli-assets.heroku.com/install.sh | sh

echo "Installing mongodb"
sudo apt install mongodb
sudo systemctl status mongodb
sudo systemctl start mongodb

echo "Installing albert"
curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
sudo wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
sudo apt update
sudo apt install albert

###############################
# Setting up LAMP stack tools #
###############################

echo "Installing apache"
sudo apt-get install apache2 -y

echo "Installing php"
sudo apt-get install php libapache2-mod-php -y

echo "Now, please move index.html after index.php"

echo "Modifying access permission to apache folders for current user"
sudo chown hooiyan:hooiyan -R ./

echo "Installing mysql"
sudo apt-get install mysql-server -y

echo "Checking mysql status"
sudo service mysql status

echo "Installing phpmyadmin"
sudo apt-get install phpmyadmin -y

echo "Setting mysql password same as phpmyadmin"

# ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';

echo "Installing vlc"
sudo snap install vlc -y

echo "Installing spotify"
sudo snap install spotify -y

##########################
# Setting up macOS theme #
##########################

echo "Installing gnome-tweaks"
sudo apt-get install gnome-tweaks -y

echo "Instaling gnome-shell-extension"
sudo apt-get install gnome-shell-extension -y
