## README 

### Introduction

My `.bashrc`, `.vimrc` and other init files.

## Installation on a new laptop/desktop

First, clone the repository.

``` bash
mkdir -p ${HOME}/init
cd ${HOME}/init
$ git clone git@github.com:shyamsfo/dotfiles.git
```

Next, create links to these dotfiles in the home directory
``` bash
cd ${HOME}/init/dotfiles
./install.sh
```
(Any existing files are saved into `${HOME}/old_dotfiles`)

Create `.bashrc_custom` in the home directory for further customizations.

Finally, start a new shell for these to take effect

``` bash
exec bash --login
```

## Installation on remote hosts

Start a shell on your desktop.
First update hosts file in this directory.
Then run:
```
ansible-playbook sync.yml
```

## Usage

Start a new shell to enjoy the new dotfiles

* Repo owner or admin
* Other community or team contact

## Description

### Bashrc

TBD. Add more details...

### MAC
run `mac_brew_setup.sh` to install usual set of mac brew packages
run `setup_fonts` to install extra (powerline) fonts for mac

### Vimrc

Setup for vim:
``` bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
#Now open vim and run :PluginInstall
```

TBD. Add more details...

### aliases

TBD. Add more details...
* aliases are setup in `$HOME/.aliases` and automatically sourced from bashrc
* Make adjustments as needed.

### Git

`$HOME/.gitconfig` has the git settings. Change as needed

### IPython

ipython configs are installed to this directory: `IPY_INIT_DIR=${HOME}/.ipython/profile_default`

## Notes

TBD. Add more details...

## License

See [LICENSE.md](./LICENSE.md).
