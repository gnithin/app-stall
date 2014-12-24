#! /bin/bash

#############
#TODO
#----
#DONE	Read arguments
#DONE	Make List of apps
#DONE	Add to file
#DONE	Read from file
#Make list of applications
#Update usage and help
#Make readme file
#Check if already installed
#############

usage(){
cat << EOL
Put error message here.
EOL
}

help(){
cat << EOL
Put help message here.
EOL
}

no_prompt='y'

while getopts ":hp" opt
do
	case $opt in
		h)
			help
			exit 1
			;;
		p)
			no_prompt='n'
			;;
		?)
			usage
			exit 2
			;;
	esac
done

echo $no_prompt

declare -a app_names
#reading the file into the array
while read line
do
	res_str=$(grep ^# <<< "$line")
	if [ "$res_str" = "" ]
	then
		app_names=("${app_names[@]}" $line)
	fi
done < "apps_file.txt"


for app in "${app_names[@]}"
do
	echo -e "Beginning to install - \n$app\n"
#	if [ "$no_prompt" != 'y' ]
#	then
#		apt-get install "$app";
#	else
#		apt-get -y install "$app";
#	fi
done

