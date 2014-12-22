vim
===

Clone the current repository in **~/**.

To initialize execute **./setup.sh**, existent in the **scripts** folder.

To add or remove vim modules, add the corresponding github repos in /scripts/packages and then execute . 
***Do not tamper with the /scripts/packages_legacy*** file, as it keeps track of the previous configuration.

Finally, backup your **.vim/**, **.vimrc** and create soft links to automatically sync the changes you make to the repository.

```
ln -s ~/vim/ ~/.vim
ln -s ~/vim/vimrc ~/.vimrc
```

My Vim cheatsheet: https://docs.google.com/document/d/1G-RNkSP521vA6fK5FTeAyWD2JW_raE61OQlB60To_dQ/edit?usp=sharing
