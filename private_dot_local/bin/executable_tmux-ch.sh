#!/usr/bin/env bash

languages=`echo "golang rust javascript typescript lua html css c cpp nodejs" | tr ' ' '\n'`
core_utils=`echo "xargs find grep sed awk" | tr ' ' '\n'`
selected=`printf "$languages\n$core_utils" | fzf`

read -p "query : " query
if printf "$languages" | grep -qs "$selected"; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi
