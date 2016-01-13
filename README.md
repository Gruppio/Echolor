![alt Echolor](https://raw.github.com/Gruppio/Echolor/assets/Header.png "Echolor")

[![Analytics](https://ga-beacon.appspot.com/UA-39980089-6/Gruppio/Echolor)](https://github.com/igrigorik/ga-beacon)

# Echolor
#### The most colorful echo command ...Bring colors to your terminal Scripts!

Bash scripting is great but is not very user friendly if you want to color in your output text.

**Echolor** is an improved echo command that features some super useful options for color the printed text.

### Example:
```Shell
# This command will print the text to the standard output with a red color
./echolor --Red "Red Text"
```
### More Examples:
![alt Examples](https://raw.github.com/Gruppio/Echolor/assets/Examples.png "Examples")

### All Options Available:
* **-h | --help** 	Print the correct usage
* **-bk | --black** Print the following parameters with a black color
* **-r | --red** 	Print the following parameters with a red color
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
* **-h | --hex** Print the following parameters with a color from in a hex format. The hex color shall not start with the # but just 6 hex digits.  Example: `./echolor --hex F8E4B0 text`
* **-rgb5** Print the following parameters with the specified R G B components. The R G B components must have a range between 0-5 and must be divided by a comma without spaces.  Example: `./echolor -rgb5 1,2,3 text`
* **-rgb100** Print the following parameters with the specified R G B components. The R G B components must have a range between 0-100 and must be divided by a comma without spaces.  Example: `./echolor -rgb100 10,20,30 text`
* **-rgb | -rgb255** Print the following parameters with the specified R G B components. The R G B components must have a range between 0-255 and must be divided by a comma without spaces.  Example: `./echolor -rgb 100,200,255 text`
* **-fg | --foreground** Color the foreground **( default )**
* **-bg | --background** Color the background  Example: `./echolor -bg -R " text "`
* **-n | -il | --in-line** With this option the command will not print the new line character after the execution
* **-ran | --random** Print the following parameters with a random color
* **-rb | --rainbow** Print the following parameters with a different color for each character following the classical Rainbow schema
* **-code | --color-code** Print the following parameters with the specified color code, the code must be a number between 0-255.  Example: `./echolor --code 128 text`
* **--get-color-code** Print the color code from the R G B components. The R G B components must have a range between 0-255 and must be divided by a comma without spaces.  Example: `./echolor --get-color-code 100,200,255`


## Requirements:
A terminal that support 256 colors.

## How to Install:
```Shell
git clone https://github.com/Gruppio/Echolor.git
cd Echolor
./echolor -R "Hi"
# or
./install.sh # This will just copy ./echolor to /usr/local/bin
```



