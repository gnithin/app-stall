#! /bin/bash

#############
#TODO
#----
#Read arguments
#DONE	Make List of apps
#DONE	Add to file
#DONE	Read from file
#Check if already installed
#############

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

#no_prompt='y'

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

