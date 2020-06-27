sudo apt-get update

echo 'installing curl and other essentials'
sudo apt install curl build-essential libssl-dev

echo 'installing git'
sudo apt install git -y

echo "What name do you want to use in GIT user.name?"
read git_config_user_name
git config --global user.name "$git_config_user_name"
clear

echo "What email do you want to use in GIT user.email"
read git_config_user_email
git config --global user.email $git_config_user_email
clear

echo "Generating a SSH key"
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

echo 'installing zsh'
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh

echo 'installing tool to handle clipboard via CLI'
sudo apt-get install xclip -y


curl https://raw.githubusercontent.com/creationix/nvm/v0.35.0/install.sh | bash

echo 'installing node'
nvm install node

echo 'installing node - lts'
nvm install --lts

echo 'set to use lts version'
nvm use --lts

