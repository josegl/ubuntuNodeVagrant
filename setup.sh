cd
mkdir bin
cd bin
repo="https://github.com/josegl/dotfiles";
git clone $repo
cd dotfiles
sed -i.bak -e 's/usr\/lib\/python3\.4\/site/usr\/local\/lib\/python2\.7\/dist/g' .tmux.conf
./setupEnvironment.sh
cd ~/bin
echo 'Paste here latest nodejs version url: '
read url
wget $url
tar -xf node*
nodeDir=$(ls -p | grep node | grep /)
cd $nodeDir/bin
sudo ./npm install -g n
sudo ./n latest
cd
sudo npm install -g npm
sudo npm install -g n

echo "Latest node and npm versions installed system globally."
echo "Let's install vim plugins. Once it has finished, quit vim to continue."
echo "Press any key to continue"
read key
vim -c "PluginInstall"
cd ~/.vim/bundle/YouCompleteMe
./install.py
cd ../tern_for_vim
npm install
cd
echo 'Installing mongodb'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.listkj
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo service mongod start
echo 'Installing heroku toolbelt'
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
echo 'Changing from bash to zsh'
sudo usermod -s /bin/zsh vagrant
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "Done."
echo "It's highly recommended to log out and log in again in order reload all environment variables"
echo "with the correct values."
