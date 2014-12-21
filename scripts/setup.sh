cd ../

# Check for removed packages
exec 4<scripts/packages_legacy
while read LINE <&4; do
  if ! grep -Fxq "$LINE" scripts/packages
  then
    module=$(echo $LINE | awk -F"/" '{print $NF}')
    module=bundle/$module
    module=${module:0:-4}

    # Remove the submodule manually
    git config -f .git/config --remove-section submodule.$module
    git config -f .gitmodules --remove-section submodule.$module
    git rm --cached $module
    rm -rf $module
    rm -rf .git/modules/$module
    echo ">>> $module removed"
  fi
done

git submodule init

#Update the packages
exec 4<scripts/packages
while read LINE <&4; do
  # Get last part of repo (*.git) 
  module=$(echo $LINE | awk -F"/" '{print $NF}')
  echo ">>> Cloning $module"
  # Remove .git
  module=${module:0:-4}
  # module is the folder's name
  git submodule add $LINE bundle/$module/
done

#Copy the new packages to legacy file
cp scripts/packages scripts/packages_legacy

git submodule update
