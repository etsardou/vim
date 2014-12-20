cd ../
git submodule init
git submodule update

exec 4<scripts/packages

while read LINE <&4; do
  
  # Get last part of repo (*.git) 
  modules=$(echo $LINE | awk -F"/" '{print $NF}')
  echo ">> Cloning $modules"
  # Remove .git
  module=${module:0:-4}
  # module is the folder's name
  
  git submodule add $LINE
  mv $module bundle
done

