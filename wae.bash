#!/usr/bin/env bash 
# Copyright 2017-2022 by SDRausty. All rights reserved.  🌎 🌍 🌏 🌐 🗺
# Hosting https://WAE.github.io/WAE courtesy https://pages.github.com
# https://www.bing.com/search?q=grey+music+cognition
################################################################################
set -e

# . printoutstatements.sh
printf "\e[?25l\e[0m\n"

finish () {
printf "\e[?25h\e[0mint caught\n"
}
trap finish EXIT 


attr1 () {
	a1=$1
}

attr2 () {
	a2=$2
}

attr3 () {
	if [ "$3" = "csa3w" ];then
		# Red Pink Red
		declare -g a3="196 197 198 199 200 201 200 199 198 197"
	elif [ "$3" = "csa34651" ];then
		declare -g a3="46 47 48 49 50 51 50 49 48 47"
	elif [ "$3" = "csa3w2" ];then
		declare -g a3="124 125 126 127 128 129 128 127 126 125 124"
	elif [ "$3" = "csa3cm" ];then
		declare -g a3="154 155 156 157 158 159 158 157 156 155"
	elif [ "$3" = "csa34" ];then
		declare -g a3="100 101 102 103 104 105 104 103 102 101"
	elif [ "$3" = "csa35" ];then
		declare -g a3="40 41 42 43 44 45 44 43 42 41"
	elif [ "$3" = "csa3d5" ];then
		declare -g a3="22 23 24 25 26 27 26 25 24 23"
	elif [ "$3" = "csa36a" ];then
		declare -g a3="57 63 69 75 81 87 81 75 69 63"
	elif [ "$3" = "csa36" ];then
		declare -g a3="57 63 69 75 81 87 51 45 39 33 27 21 20 21 27 33"
		#declare -g a3="20 21 27 33 39 45 51 87 81 75 69 63 57 63 69 75 81 87 51 45 39 33 27 21 20 21 27 33"
	elif [ "$3" = "csa36b" ];then
		declare -g a3="57 63 69 75 81 87 51 45 39 33 27 21 20 21 27 33 39 45"
	elif [ "$3" = "csa367a" ];then
		declare -g a3="118 119 120 121 122 123 122 121 120 119"
	elif [ "$3" = "csa367b" ];then
		declare -g a3="34 40 46 82 118 119 120 121 122 123 122 121 120 119 118 82 46 40 34"
	elif [ "$3" = "csa367" ];then
		declare -g a3="154 118 82 46 40 34 28 22 23 22 28 34 40 46 82 118 154" 
	elif [ "$3" = "csa37" ];then
		declare -g a3="27 26 25 24 23 22 23 24 25 26"
	elif [ "$3" = "csa3fifteen" ];then
		declare -g a3="1 2 3 4 5 6 7 8 9 10 11 12 13 14 15"
	else
		:
	fi
}

cl0 () 
{	# Creates and prints out statements 
	declare -g a1=""
	declare -g a2=""
	declare -g a3=""
	declare a1t=`echo $1|sed 's/^\(....\).*/\1/'`
	declare a2t=`echo $2|sed 's/^\(....\).*/\1/'`
	declare a3t=`echo $3|sed 's/^\(....\).*/\1/'`
	if [[ $a1t == "csa1" ]];then 
		attr1 $@ 
	else
		a1=$1
	fi
	if [[ $a2t == "csa2" ]];then 
		attr2 $@ 
	else
		a2=$2
	fi
	if [[ $a3t == "csa3" ]];then 
		attr3 $@ 
	else
		a3=$3
	fi
	declare COUNTER=0
	# Backspaces
	declare numb=""
	# Number of backspaces
	declare num=$(($(echo $7 |wc -c)-$6))
	for ((i=0;i<$num;i++)) ; do
		numb+="\b"
	done
	# Number of loop iterations 
	declare numi=$(echo $a1 |wc -w)*$(echo $a2 |wc -w)*$(echo $a3 |wc -w)  
	while true ;do
		for a1 in $a1 ; do
			for a2 in $a2 ; do
				for a3 in $a3 ; do
#					printf "\e[${a1};${a2};${a3}m$7"
					printf "\e[${a1};${a2};${a3}m%s" "$7"
#					printf "\e[${a1};${a2};${a3}m${a1} ${a2} ${a3} $7"
					let COUNTER=COUNTER+1 
					if [[ $COUNTER -lt $numi ]];then 
						printf "$numb"
					elif [[ $COUNTER -eq $numi ]];then 
						if [[ $4 -eq 0 ]];then 
							printf "\e[0m"
						elif [[ $4 -eq 1 ]];then 
							printf "\e[0m\n"
						elif [[ $4 -eq 2 ]];then 
							printf "\e[0m\n\n"
						elif [[ $4 -eq 3 ]];then 
							printf "$numb"
						elif [[ $4 -eq 4 ]];then 
							printf "$numb\e[0m"
						else
							:
						fi
						break
					fi
					sleep $5
				done
				if [[ $COUNTER -eq $numi ]];then 
					break
				fi
			done
			if [[ $COUNTER -eq $numi ]];then 
				break
			fi
		done
		if [[ $COUNTER -eq $numi ]];then 
			break
		fi
	done
}

play () {
while true;do printplay "$@";play-audio "$@" 1>/dev/null;declare -g snooze="${RANDOM::3}";printsnooze "$@";sleep $snooze;done
}

printplay () { #cl0 a1 a2 a3 nl ltime offset print  
	printf '\033]2; 🔆 Gray music wae (wait an event) playing '"$@"' 🔩🔧 \007'
	cl0 38 5 csa37 4 0.01 11 " 🔆 Playing play-audio $@!   " 
	cl0 48 5 csa37 4 0.01 0 " 🔆 Playing play-audio $@!   " 
	cl0 0 0 1 3 0.01 0 " 🔆 Playing play-audio $@!   " 
	cl0 48 5 29 2 0.01 0 " 🔆 Playing play-audio $@!   " 
}

printsnooze () { #cl0 a1 a2 a3 nl ltime offset print 
	printf '\033]2; 🔆 Gray music wae (wait an event) snoozing '"$snooze"' seconds 🔩🔧 \007'
	cl0 38 5 csa37 4 0.01 12 " 🔆 Snoozing play-audio $@ for $snooze seconds!   " 
	cl0 48 5 csa37 4 0.01 0 " 🔆 Snoozing play-audio $@ for $snooze seconds!   " 
	cl0 0 1 1 3 0.01 0 " 🔆 Snoozing play-audio $@ for $snooze seconds!   " 
	cl0 48 5 29 2 0.01 0 " 🔆 Snoozing play-audio $@ for $snooze seconds!   " 
}

tak () {
	echo Tap any key to continue.
	read -rsn1 <&1
	play "$@"
}

wtde () {
		echo wtde
#		read -rn 1 -t 0.1 input
		if [[ $input = "E" ]] || [[ $input = "e" ]] || [[ $input = "Q" ]] || [[ $input = "q" ]];then
			echo wtde1
			printf "\e[0m\n\n"'\033]2; 🔆 User initiated shutdown! 🔩🔧 \007'
			cl0 14 1 1 1 39 " 🔆 WARNING User initiated shutdown!"
			cl0 2 1 1 1 39 " 🔆 WARNING User initiated shutdown!"
			#"\e[?25h" shows cursor
			printf "\n\n\e[?25h"
			exit
		fi
		echo wtde2
	}

wtdel () {
	while true;do
		echo wtdel
		wtde
		play $@
	done
}

play "$@"

#EOF
