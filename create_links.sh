cd ${HOME}
base_dir=$(pwd)
file_list='.bashrc .bash_profile .aliases .vimrc .emacs .editrc .inputrc .curlrc .tmux.conf .screenrc .gitconfig .gitignore .ackrc'
echo "Linking dotfiles from ${base_dir} to ${HOME}"
mkdir -p ${HOME}/old_dotfiles
for file in ${file_list}
do
    if [ -f ~/${file} ]; then
        cp ${HOME}/${file} ${HOME}/old_dotfiles
        rm ${file}
    fi
done
for file in ${file_list}
do
    echo "Linking $file"
    ln -s ${base_dir}/${file} ${HOME}/${file} done
