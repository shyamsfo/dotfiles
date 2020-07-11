cd ${HOME}
base_dir=${HOME}/init/dotfiles
file_list='.bashrc .bash_profile .aliases .vimrc .emacs .editrc .inputrc .curlrc .tmux.conf .screenrc .gitconfig .gitignore .ackrc'
echo "Linking dotfiles from ${base_dir} to ${HOME}"
mkdir -p ${HOME}/old_dotfiles
cd ${base_dir}
echo "${base_dir}"
echo "removing files"
for file in ${file_list}
do
    echo "Removing ${HOME}/${file}"
    \rm ${HOME}/${file}
    if [ -f ${HOME}/${file} ]; then
        cp ${HOME}/${file} ${HOME}/old_dotfiles
        echo "Removing ${HOME}/${file}"
        \rm ${HOME}/${file}
    fi
done

