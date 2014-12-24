#! /bin/bash

#############
#TODO
#----
#Read arguments
#Make List of apps
#Add to file
#Read from file
#Check if already installed
#############


declare -A app_names=([vlc]='vlc' [random1]='xvlc' [random2]='bbc');
#no_prompt='y'

for app_key in "${!app_names[@]}"
do
	echo -e "Beginning to install - \n$app\n"
	app=${app_names["$app_key"]}
	if [ "$no_prompt" != 'y' ]
	then
		apt-get install "$app";
	else
		apt-get -y install "$app";
	fi
done
