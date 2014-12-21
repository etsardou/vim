# Get the compile-dependencies of vim
sudo apt-get build-dep vim
# If you haven't got mercurial, get it
sudo apt-get install mercurial
# Get the source
hg clone https://vim.googlecode.com/hg/ vim_source
# Compile it
cd vim_source
./configure \
    --enable-perlinterp=dynamic \
    --enable-pythoninterp=dynamic \
    --enable-rubyinterp=dynamic \
    --enable-cscope \
    --enable-gui=auto \
    --enable-gtk2-check \
    --enable-gnome-check \
    --with-features=huge \
    --with-x \
    --with-compiledby="Your Name <youremail@domain.com>" \
    --with-python-config-dir=/usr/lib/python2.7/config
make && sudo make install
