cd ../
git submodule init
git submodule update

exec 4<scripts/packages

while read LINE <&4; do
  
  # Get last part of repo (*.git) 
  module=$(echo $LINE | awk -F"/" '{print $NF}')
  echo ">> Cloning $module"
  # Remove .git
  module=${module:0:-4}
  # module is the folder's name
  
  git submodule add $LINE bundle/$module/
done

# Keep backups of .vim/ & .vimrc
mv ~/.vim ~/.vim_back
mv ~/.vimrc ~/.vimrc_back

# Create links
ln -s $(echo $PWD) ~/.vim
ln -s $(echo $PWD)/vimrc ~/.vimrc
