## README 

### Introduction

My `.bashrc`, `.vimrc` and other init files.

## Installation on a new laptop/desktop

First, clone the repository.

```
sh
$ git clone git@bitbucket.org:shyamsfo/init
```

Next, create links to these dotfiles in the home directory
```
cd ${HOME}/init
./dotfiles/create_links.sh
```
(Any existing files are saved into `${HOME}/old_dotfiles`)

Finally, start a new shell for these to take effect

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
### Vimrc

TBD. Add more details...
### aliases

TBD. Add more details...

### Git

TBD. Add more details...

## Notes

TBD. Add more details...

## License

See [LICENSE.md](./LICENSE.md).
