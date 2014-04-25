#!/bin/bash
#Questo script fa uso di variabili d'ambiente per fornire informaziona su utente e macchina in running

echo "Informazioni sul SISTEMA:"
echo "hostname: $HOSTNAME"
echo "hardware: $HOSTTYPE"
echo "OS: $OSTYPE"

echo "Informazione sull' UTENTE:"
echo "logname: $LOGNAME"
echo "homedir: $HOME"
echo "shell: $SHELL"
echo "path: $PATH"
