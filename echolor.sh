#!/bin/bash

function printColoredText {
	if [[ $# -ne 2 ]] 
	then
		printUsage
	fi

	#case $1 in
    #[0-255]) ;;
	#*) printUsage ;;
	#esac

	printf "\033[38;5;$1m$2\033[0m\n"
}


function printUsage {
	echo "$0 Error - Print Usage"
	exit -1
}

function getColorCode {

	if [[ $# -ne 3 ]] 
	then
		printUsage
	fi

	case $1 in
    [0-5]) ;;
	*) printUsage ;;
	esac

	case $2 in
    [0-5]) ;;
	*) printUsage ;;
	esac

	case $3 in
    [0-5]) ;;
	*) printUsage ;;
	esac

	echo $((16 + (36 * $1) + (6 * $2) + $3))
}

function printTextWithRGBColor {

	color=-1
	if [ "$1" == "-rgb5" ] 
	then
		color=$(getColorCode $2 $3 $4)
	fi

	if [ "$1" == "-rgb100" ] 
	then
		r=$(($2/20))
		g=$(($3/20))
		b=$(($4/20))
		color=$(getColorCode $r $g $b)
	fi

	if [ "$1" == "-rgb" ] 
	then
		r=$(($2/51))
		g=$(($3/51))
		b=$(($4/51))
		color=$(getColorCode $r $g $b)
	fi

	printColoredText $color $2 
}



function printTextWithColor {

	color=-1
	if   [ "$1" == "-bk" -o "$1" == "--black" ];		then color=0
	elif [ "$1" == "-r"  -o "$1" == "--red" ];			then color=1
	elif [ "$1" == "-g"  -o "$1" == "--green" ]; 		then color=2
	elif [ "$1" == "-y"  -o "$1" == "--yellow" ]; 		then color=3
	elif [ "$1" == "-b"  -o "$1" == "--blue" ]; 		then color=4
	elif [ "$1" == "-m"  -o "$1" == "--magenta" ]; 		then color=5
	elif [ "$1" == "-c"  -o "$1" == "--cyan" ]; 		then color=6
	elif [ "$1" == "-w"  -o "$1" == "--white" ]; 		then color=7
	elif [ "$1" == "-dg" -o "$1" == "--dark_gray" ]; 	then color=8
	elif [ "$1" == "-R"  -o "$1" == "--Red" ];   		then color=9
	elif [ "$1" == "-G"  -o "$1" == "--Green" ]; 		then color=10
	elif [ "$1" == "-Y"  -o "$1" == "--Yellow" ]; 		then color=11
	elif [ "$1" == "-B"  -o "$1" == "--Blue" ]; 		then color=12
	elif [ "$1" == "-M"  -o "$1" == "--Magenta" ]; 		then color=13
	elif [ "$1" == "-C"  -o "$1" == "--Cyan" ]; 		then color=14
	elif [ "$1" == "-W"  -o "$1" == "--White" ]; 		then color=15
	elif [ "$1" == "-BK" -o "$1" == "--Black" ]; 		then color=16
	fi

	printColoredText $color $2 
}

function numberOfDashes {
	string=$1
	numDashes=0
	characterIndex=0
	while [ $characterIndex -lt ${#string} ] 
	do
		character=${string:characterIndex:1}
		if [ "$character" == "-" ] 
		then
			characterIndex=$((characterIndex+1))
			numDashes=$((numDashes+1))
		else
			break
		fi
	done
	echo "$numDashes"
}


#numberOfParameters=$#
#parameters=$*


case $# in
	1)
		echo "$1"
	;;

	2)
		printTextWithColor $1 $2
	;;

	5)
		printTextWithRGBColor $1 $2 $3 $4 $5
	;;

	*)
		printUsage
	;;
esac



#echo "$numberOfParameters"

#for parameter in $parameters
#do
	#echo "$parameter"
#done