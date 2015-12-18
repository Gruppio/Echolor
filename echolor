#!/bin/bash

# Michele Gruppioni 2015
# http://www.michelegruppioni.com

# For more info
# http://misc.flogisoft.com/bash/tip_colors_and_formatting

# $1 Color Code [0 - 255]  
# $2 The text
function printColoredText {
	if [[ $# -ne 2 ]] 
	then
		printUsage
	fi

	#case $1 in
    #[0-255]) ;;
	#*) printUsage ;;
	#esac

	if [[ $1 -lt 0 ]] 
	then
		printf "\033[0m$2"
	else
		printf "\033[38;5;$1m$2\033[0m"
	fi

	
}


function printUsage {
	echo "$0 Error - Print Usage"
	exit -1
}



# $1 = Red Component   [0 - 5]
# $2 = Green Component [0 - 5]
# $3 = Blue Component  [0 - 5]
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

# $1 The option [-rgb5, -rgb100, -rgb255]
# $2 Red Component
# $3 Green Component
# $4 Blue Component
# $5 The Text to print
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

	printColoredText $color $5
}




# Main
#color=-1
#if   [ "$1" == "-bk" -o "$1" == "--black" ];		then color=0
#elif [ "$1" == "-r"  -o "$1" == "--red" ];			then color=1
#elif [ "$1" == "-g"  -o "$1" == "--green" ]; 		then color=2
#elif [ "$1" == "-y"  -o "$1" == "--yellow" ]; 		then color=3
#elif [ "$1" == "-b"  -o "$1" == "--blue" ]; 		then color=4
#elif [ "$1" == "-m"  -o "$1" == "--magenta" ]; 		then color=5
#elif [ "$1" == "-c"  -o "$1" == "--cyan" ]; 		then color=6
#elif [ "$1" == "-w"  -o "$1" == "--white" ]; 		then color=7
#elif [ "$1" == "-dg" -o "$1" == "--dark_gray" ]; 	then color=8
#elif [ "$1" == "-R"  -o "$1" == "--Red" ];   		then color=9
#elif [ "$1" == "-G"  -o "$1" == "--Green" ]; 		then color=10
#elif [ "$1" == "-Y"  -o "$1" == "--Yellow" ]; 		then color=11
#elif [ "$1" == "-B"  -o "$1" == "--Blue" ]; 		then color=12
#elif [ "$1" == "-M"  -o "$1" == "--Magenta" ]; 		then color=13
#elif [ "$1" == "-C"  -o "$1" == "--Cyan" ]; 		then color=14
#elif [ "$1" == "-W"  -o "$1" == "--White" ]; 		then color=15
#elif [ "$1" == "-BK" -o "$1" == "--Black" ]; 		then color=16
#elif [ "$1" == "-rgb5" -a $# -gt 5]; then color=$(getColorCode $2 $3 $4)
#else
#	echo $*
#fi

#printColoredText $color $2 

color=-1
for arg in "$@"
do
	case $arg in
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
		-rgb5)
			if [ $# -gt 3 ]; then
				echo "$2 $3 $4"
				color=$(getColorCode $2 $3 $4)
				shift 3
			else
				echo "Error"
			fi
		;;
	    *) printColoredText $color "$arg " ;;
	esac
	shift
done

printf "\n"

