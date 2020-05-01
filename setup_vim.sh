if [ -d ${HOME}/.vim ] 
then
    echo "Moving old .vim away"
    mv ${HOME}/.vim ${HOME}/.vim_old 
fi
mkdir -p ${HOME}/.vim/bundle/
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

