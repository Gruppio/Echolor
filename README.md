# Echolor
**The most colorful echo command!**

Bash scripting is great but is not very user friendly if you want to color in your output text.

**Echolor** is an improved echo command that features some super useful options for color the printed text.

### Example
```Shell
# This command will print the text to the standard output with a red color
./echolor --Red "Red Text"
```

### All Options Available:
* **-h | --help** Print the correct usage
* **-bk | --black** Print the following parameters with a black color
* **-r | --red** Print the following parameters with a red color
* **-g | --green** Print the following parameters with a green color
* **-y | --yellow** Print the following parameters with a yellow color
* **-b | --blue** Print the following parameters with a blue color
* **-m | --black** Print the following parameters with a magenta color
* **-c | --cyan** Print the following parameters with a cyan color
* **-w | --white** Print the following parameters with a white color
* **-gy | --gray** Print the following parameters with a gray color
* **-R | --Red** Print the following parameters with a bright red color
* **-G | --Green** Print the following parameters with a bright green color
* **-Y | --Yellow** Print the following parameters with a bright yellow color
* **-B | --Blue** Print the following parameters with a bright blue color
* **-M | --Black** Print the following parameters with a bright magenta color
* **-C | --Cyan** Print the following parameters with a bright cyan color
* **-W | --White** Print the following parameters with a bright white color
* **-Gy | --Gray** Print the following parameters with a bright gray color
* **-h | --hex** Print the following parameters with a color from in a hex format.\n The hex color shall not start with the # but just 6 hex digits.\n example: ./echolor --hex F8E4B0 text \n
/*
	$0 -C " -rgb5"				-W " Print the following parameters with the specified R G B components.\n The R G B components must have a range between 0-5 and must be divided by a comma without spaces.\n example: " -G "$0 -rgb5 1,2,3 text \n"
	$0 -C " -rgb100"			-W " Print the following parameters with the specified R G B components.\n The R G B components must have a range between 0-100 and must be divided by a comma without spaces.\n example: " -G "$0 -rgb5 10,20,30 text \n"
	$0 -C " -rgb|-rgb255"		-W " Print the following parameters with the specified R G B components.\n The R G B components must have a range between 0-255 and must be divided by a comma without spaces.\n example: " -G "$0 -rgb5 100,200,255 text \n"
	$0 -C " -fg|--foreground"	-W " Color the foreground ( default )"
	$0 -C " -bg|--background"	-W " Color the background " -bg -R " example " -fg ""
	$0 -C " -n|-il|--in-line"	-W " With this option the command will not print the new line character after the execution\n"
	$0 -C " -ran|--random"		-W " Print the following parameters with a random color"
	$0 -C " -rb|--rainbow"		-W " Print the following parameters with a different color for each character " -rb "example"
	$0 -C " -code|--color-code <code>" -W " Print the following parameters with the specified color code, the code must be a number between 0-255.\n"
	$0 -C " --get-color-code <r,g,b>" 	-W " Print the color code from the R G B components. The R G B components must have a range between 0-255 and must be divided by a comma without spaces.\n"

*/
	


## Requirements:
A terminal that support 256 colors.

# Basic Usage:
