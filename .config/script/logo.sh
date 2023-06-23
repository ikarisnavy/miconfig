#!/bin/sh
#
# system info for debian

## LOGO

## DEFINE COLORS

# probably don't change these
bold="$(tput bold)"
black="$(tput setaf 0)"
red="$(tput setaf 1)"
green="$(tput setaf 2)"
yellow="$(tput setaf 11)"
blue="$(tput setaf 4)"
magenta="$(tput setaf 13)"
cyan="$(tput setaf 14)"
white="$(tput setaf 7)"
reset="$(tput sgr0)"

# you can change these
lc="${reset}${bold}${red}"		# labels
nc="${reset}${bold}${red}"		# user and hostname
ic="${reset}${regular}${white}"	# info
c0="${reset}${bold}${red}"		# first color
c1="${reset}${red}"				# second color
y3="${reset}${bold}${yellow}"
c2="${reset}${bold}${cyan}"
v1="${reset}${bold}${magenta}"
c2="${reset}${bold}${cyan}"

## OUTPUT

cat <<EOF
${lc}    _____    	
${lc}   /  __ \\   	
${lc}  |  /    |  	
${lc}  |  ${lc}\\___- 	
${lc}   -_        	
${lc}     --_     	
${lc}             	
${lc}		
EOF
