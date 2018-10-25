#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
reset=`tput sgr0`

prnt_yellow() {
    echo "${yellow}${1}${reset}"
}

prnt_red() {
    echo "${red}${1}${reset}"
}

prnt_green() {
    echo "${green}${1}${reset}"
}

error() {
    prnt_red "$1" >&2
    exit 1
}
