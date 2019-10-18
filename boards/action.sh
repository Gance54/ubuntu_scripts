#!/bin/bash
source /mnt/ssd/repo/scripts/prnt.sh
source boards.conf

function check_board () {
	if [[ "${BOARD_LIST[@]}" =~ "$1" ]]; then
		return 0
	fi

	print_help
	error "Unsupported board $1."
}

function check_action () {
	if [[ "${ACTION_LIST[@]}" =~ "$1" ]]; then
		return 0
	fi

	print_help
	error "Unsupported action $1."
}

function print_help () {
	echo "Usage: $0 <board name> <action>"
	echo "Example: $0 x15 reboot"
	echo "Supported boards: ${BOARD_LIST[*]}"
	echo "Supported actions: on off reboot"
}

function setup () {
	BOARD=$1
	ACTION=$2
	ON=1
	OFF=0

	check_board $BOARD
	check_action $ACTION

	P_PORT=$(value $BOARD[power_supply_port])
	B_PORT=$(value $BOARD[power_btn_port])
	PH_SERIAL=$(value $BOARD[phid_serial])
	DESC=$(value $BOARD[desc])
}

function turn_on() {
	phidutil2 -s $PH_SERIAL -p $P_PORT $ON
	sleep 0.5
	phidutil2 -s $PH_SERIAL -p $B_PORT $ON
	sleep 0.5
	phidutil2 -s $PH_SERIAL -p $B_PORT $OFF
}

function turn_off() {
	phidutil2 -s $PH_SERIAL -p $P_PORT $OFF
}

function reboot() {
	phidutil2 -s $PH_SERIAL -p $P_PORT $OFF
	sleep 0.5
	phidutil2 -s $PH_SERIAL -p $P_PORT $ON
	sleep 0.5
	phidutil2 -s $PH_SERIAL -p $B_PORT $ON
	sleep 0.5
	phidutil2 -s $PH_SERIAL -p $B_PORT $OFF
}

setup $1 $2

case $ACTION in
	on)
		echo "Turning on $DESC"
		turn_on
		;;
	off)
		echo "Turning off $DESC"
		turn_off
		;;
	reboot)
		echo "Rebooting $DESC"
		reboot
		;;
	*)
		prnt_red "Action $ACTION is not supported. What me do"
		print_help
		;;
esac
