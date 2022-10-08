#!/usr/bin/env zsh

# zsh rc
if [ -f $HOME/.zshrc ]
then
	mv $HOME/.zshrc $HOME/.zshrc.old
fi
ln -s $HOME/Cross/dotfiles/zsh/.zshrc $HOME/.zshrc
# themes for oh-my-zsh
if [ -f $HOME/.p10k.zsh ]
then
	mv $HOME/.p10k.zsh $HOME/.p10k.zsh.old
fi
ln -s $HOME/Cross/dotfiles/zsh/.p10k.zsh $HOME/.p10k.zsh
if [ -f $HOME/.p10k.zsh ]
then
	mv $HOME/Cross/dotfiles/zsh/themes/powerlevel10k $HOME/Cross/dotfiles/zsh/themes/powerlevel10k.old
fi
ln -s $HOME/Cross/dotfiles/zsh/themes/powerlevel10k $HOME/.oh-my-zsh/themes/powerlevel10k
