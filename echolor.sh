#!/bin/bash

# Michele Gruppioni 2015
# http://www.michelegruppioni.com

# For more info
# http://misc.flogisoft.com/bash/tip_colors_and_formatting

# $1 Foreground 1 / Background 0
# $2 Color Code [0 - 255]  
# $3 The text
function printColoredText {
	if [[ $# -ne 3 ]] 
	then
		printUsage
	fi

	foreground=38

	if [[ $1 == 0 ]]
	then
		foreground=48
	fi

	if [[ $2 -lt 0 ]] 
	then
		printf "\033[0m$3"
	else
		printf "\033[$foreground;5;$2m$3\033[0m"
	fi
}


function printUsage {
	echo "$0 Error - Print Usage"
	exit -1
}


function isInRange {
	if [[ "$1" =~ ^[0-9]+$ ]] && [ "$1" -ge 0 -a "$1" -le $2 ] && [ $# == 2 ]
	then
		echo $((1))
	else
		echo $((0))
	fi
}

# $1 = Red Component   [0 - 5]
# $2 = Green Component [0 - 5]
# $3 = Blue Component  [0 - 5]
function getColorCode {
	if [[ $(isInRange $1 5) && $(isInRange $2 5) && $(isInRange $3 5) && $# == 3 ]]
	then
		echo $((16 + (36 * $1) + (6 * $2) + $3))
	else
		printUsage
	fi
}

# Main
foreground=1
color=-1
while (( "$#" ))
do
	case $1 in
	    -bk|--black)	color=0 ;;
		-r|--red) 		color=1 ;;
		-g|--green) 	color=2 ;;
		-y|--yellow) 	color=3 ;;
		-b|--blue) 		color=4 ;;
		-m|--magenta) 	color=5 ;;
		-c|--cyan) 		color=6 ;;
		-w|--white) 	color=7 ;;
		-BK|--Black) 	color=8 ;;
		-R|--Red) 		color=9 ;;
		-G|--Green) 	color=10 ;;
		-Y|--Yellow) 	color=11 ;;
		-B|--Blue) 		color=12 ;;
		-M|--Magenta) 	color=13 ;;
		-C|--Cyan) 		color=14 ;;
		-W|--White) 	color=15 ;;
		-BK|--Black) 	color=16 ;;
		-fg|--foreground) foreground=1 ;;
		-bg|--background) foreground=0 ;;
		-rgb5)
			IFS=, read r g b <<< "$2"
			if [[ $r && $g && $b ]]
			then
				color=$(getColorCode $r $g $b)
				shift
			else
				printUsage
			fi
		;;
		-rgb100)
			IFS=, read r g b <<< "$2"
			if [[ $r && $g && $b ]]
			then
				r=$(($r/20))
				g=$(($g/20))
				b=$(($b/20))
				color=$(getColorCode $r $g $b)
				shift
			else
				printUsage
			fi
		;;
		-rgb|-rgb255)
			IFS=, read r g b <<< "$2"
			if [[ $r && $g && $b ]]
			then
				r=$(($r/51))
				g=$(($g/51))
				b=$(($b/51))
				color=$(getColorCode $r $g $b)
				shift
			else
				printUsage
			fi
		;;

	    *) printColoredText $foreground $color "$1 " ;;
	esac
	shift
done

printf "\n"

