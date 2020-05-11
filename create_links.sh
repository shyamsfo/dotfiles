cd ${HOME}
base_dir=${HOME}/init/dotfiles
file_list='.bashrc .bash_profile .aliases .vimrc .emacs .editrc .inputrc .curlrc .tmux.conf .screenrc .gitconfig .gitignore .ackrc'
echo "Linking dotfiles from ${base_dir} to ${HOME}"
mkdir -p ${HOME}/old_dotfiles
cd ${base_dir}
for file in ${file_list}
do
    if [ -f ${HOME}/${file} ]; then
        cp ${HOME}/${file} ${HOME}/old_dotfiles
        rm ${file}
    fi
done
for file in ${file_list}
do
    echo "Linking $file"
    ln -s ${base_dir}/${file} ${HOME}/${file} 
done

IPY_INIT_DIR=${HOME}/.ipython/profile_default
mkdir -p ${IPY_INIT_DIR}
ln -s ${base_dir}/ipython_config.py ${IPY_INIT_DIR}/ipython_config.py
