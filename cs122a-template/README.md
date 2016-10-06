# Atmel Studio RTOS Template for CS122A

## Requirements
Atmel Studio 7
[Windows Subsystem for Linux](https://msdn.microsoft.com/commandline/wsl/install_guide)

## Prep
Move or copy the following directories and files to your Atmel Studio 
project directory:
* FreeRTOS_Lab/
* rtos-template/
* template-setup.sh
* atmel-proj

## Setup
Run the `template-setup.sh` script and follow the prompts. What you enter 
here will be used in your project's main c file header comment block.
```
$ ./template-setup.sh
```
## How to use
Run the `atmel-project` script with the lab and exercise number as the 
first and second arguments respectively.
```
$ # Create a new project for Lab 3, exercise 1
$ ./atmel-proj 3 1
$ New Atmel Studio Project: [your cs login]_lab3_part1 created!
```
### For extra coolness...
After running the `template-setup.sh` script, copy or move the `atmel-proj` 
script to your `/usr/local/bin/` directory to run it from your Atmel 
projects directory without the `./`!

#### Known issues
If you try and run the `atmel-proj` script from a directory that does not 
have the rtos-template directory on the same level as the script, terrible 
things will happen. An error message will be added at a later time...
