#!/bin/bash

# Created by Yatish

#################### CHOOSING OS ####################

if [[ $(cat /etc/*-release | grep 'ID_LIKE') = *debian* ]]; then
      echo "Installing for debian"
elif [[ $(cat /etc/*-release | grep 'ID_LIKE') = *arch* ]]; then
      echo "Installing for arch"
elif [[ $(cat /etc/*-release | grep 'ID_LIKE') = *fedora* ]]; then
      echo "Installing for fedora"
else
      echo "OS not compatible!"
fi
