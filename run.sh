#!/bin/sh
echo "Welcome to the setup script"

echo "Please enter your desired root oatabase password [ENTER]: "
read -s password_root

echo "Please enter your desired password for user 'ctf' [ENTER]: "

read -s password_ctf

echo "password_root='$password_root'" > .env
echo "password_ctf='$password_ctf'" >> .env

vagrant plugin install vagrant-env
vagrant up

rm .env
