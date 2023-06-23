#!/bin/sh
#
# ufetch-debian - tiny system info for debian

## INFO

# user is already defined
#"Hola Ikari"
#"Bienvenido a Snavy"
os="Debian 11 Bullseye"
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
packages="$(dpkg -l | wc -l)"
shell="$(basename ${SHELL})"
WM="${WM}"
cpu="Intel Atom N570 (4) 1.6GHz"
#RAM="${%mb_used%}"

if [ -z "${WM}" ]; then
	if [ "${XDG_CURRENT_DESKTOP}" ]; then
		envtype='DE'
		WM="${XDG_CURRENT_DESKTOP}"
	elif [ "${DESKTOP_SESSION}" ]; then
		envtype='DE'
		WM="${DESKTOP_SESSION}"
	else
		envtype='WM'
		WM="$(tail -n 1 "/etc/X11/xinit/xinitrc" | cut -d ' ' -f 2)"
	fi
else
	envtype='WM'
fi


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
${lc}    _____    	${y3}OS${c2}: ${os}${reset}
${lc}   /  __ \\   	${y3}Kernel${c2}: ${kernel}${reset}
${lc}  |  /    |  	${y3}Uptime${c2}: ${uptime}${reset}
${lc}  |  ${lc}\\___- 	${y3}Packages${c2}: ${packages}${reset}
${lc}   -_        	${y3}Shell${c2}: ${shell}${reset}
${lc}     --_     	${y3}${envtype}${c2}: ${WM}${reset}
${lc}             	${y3}CPU${c2}: ${cpu}${reset}
${lc}		
EOF
