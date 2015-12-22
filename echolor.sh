#!/bin/bash

# Michele Gruppioni 2015
# http://www.michelegruppioni.com

# For more info
# http://misc.flogisoft.com/bash/tip_colors_and_formatting


rainbowColor=-2
rainbowColorIndex=0
rainbowColors=( 1 2 3 )
numRainbowColors=${#rainbowColors[@]}

foreground=38
background=48


# $3 The text
# $2 Color Code [0 - 255]  
# $1 Foreground 0 / Background 1
function printColoredText {

	text=$1
	colorCode=$2

	if [[ $3 == 1 ]]
	then
		foregroundCode=$background
	else
		foregroundCode=$foreground
	fi

	if [[ $colorCode == -1 ]] 
	then
		printf "\033[0m$text"
		return
	fi

	if [[ $colorCode == $rainbowColor ]]
	then
		for (( i=0 ; i < ${#text} ; i++ ))
		do 
			colorCode=${rainbowColors[$rainbowColorIndex]}
			rainbowColorIndex=$(($rainbowColorIndex +1))
			rainbowColorIndex=$(($rainbowColorIndex %$numRainbowColors))
			character=${text:i:1}
			printf "\033[$foregroundCode;5;$colorCode m$character\033[0m"
		done
		return
	fi

	printf "\033[$foregroundCode;5;$colorCode m$text\033[0m"
}


function printUsage {
	echolor -R "\nError!"
	echolor -il -W "Example: " -C "echolor -B G -R o -Y o -B g -G l -R e" -W " will print: "
	echolor -B G -R o -Y o -B g -G l -R e
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
	if [[ $(isInRange $1 5) == 1 && $(isInRange $2 5) == 1 && $(isInRange $3 5) == 1 && $# == 3 ]]
	then
		echo $((16 + (36 * $1) + (6 * $2) + $3))
	else
		echo $((-1))
	fi
}

# Main
color=-1
colorBackground=0
inline=0
whitespace=1
while (( "$#" ))
do
	case $1 in
		-h|--help)			printUsage ;;
	    -bk|--black)		color=0 ;;
		-r|--red) 			color=1 ;;
		-g|--green) 		color=2 ;;
		-y|--yellow) 		color=3 ;;
		-b|--blue) 			color=4 ;;
		-m|--magenta) 		color=5 ;;
		-c|--cyan) 			color=6 ;;
		-w|--white) 		color=7 ;;
		-dg|--dark-grey) 	color=8 ;;
		-R|--Red) 			color=9 ;;
		-G|--Green) 		color=10 ;;
		-Y|--Yellow) 		color=11 ;;
		-B|--Blue) 			color=12 ;;
		-M|--Magenta) 		color=13 ;;
		-C|--Cyan) 			color=14 ;;
		-W|--White) 		color=15 ;;
		-BK|--Black) 		color=16 ;;
		-fg|--foreground)	colorBackground=0 ;;
		-bg|--background) 	colorBackground=1 ;;
		-il|--in-line)		inline=1 ;;
		-ran|--random)		color=$(($RANDOM %255)) ;;
		-nw|--no-whitespaces) 	whitespace=0 ;;
		-yw|--yes-whitespaces) 	whitespace=1 ;;
		-rb|--rainbow)		
			color=$rainbowColor
			rainbowColorIndex=0
		;;
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
		-hex)
			if [[ $# != 0 ]]
			then
				hex=$2
				r=$(printf "%d\n" 0x${hex:0:2}) 
				g=$(printf "%d\n" 0x${hex:2:2})
				b=$(printf "%d\n" 0x${hex:4:2})
				r=$(($r/51))
				g=$(($g/51))
				b=$(($b/51))
				color=$(getColorCode $r $g $b)
				shift
			else
				printUsage
			fi
		;;
		# Actually print the text
	    *) 
			text=$1
			printColoredText "$text" $color $colorBackground 
			if [[ $whitespace == 1 ]]
			then
				printf " "
			fi
		;;
	esac
	shift
done

if [[ $inline == 0 ]]
then
	printf "\n"
fi

