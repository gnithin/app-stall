#! /bin/bash

#############
#TODO
#----
#DONE	Read arguments
#DONE	Make List of apps
#DONE	Add to file
#DONE	Read from file
#DONE	Make list of applications
#Update usage and help
#Make readme file
#Check if already installed
#Create options for reading files other than apps_list.txt
#############

usage(){
cat << EOL
Usage: 
Valid arguments are -
-h
Gives information about what apps-stall is, and examples to use it.

-p
This prompts a user before anything is being installed. It is by default turned off(by using the -y argument in apt-get install).
EOL
}

help(){
cat << EOL
app-stall
---------

app-stall is bash script that can be used to install a list of applications specified in a file.
To execute it, you need to run this command in the bash -

sudo ./script.sh

You need to use sudo, because installation requires super-user privileges.
And that's it, all the applications listed in apps_list.txt will be installed.

For instance, This is how it looks like -
nithin@nithin-Inspiron-1525:~/code/init_script$ sudo ./script.sh 
[sudo] password for nithin: 
***** Installing filezilla *****
Reading package lists... Done
Building dependency tree       
Reading state information... Done
...

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

#echo $no_prompt

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
	echo -e "***** Installing $app *****"
	if [ "$no_prompt" != 'y' ]
	then
		apt-get install "$app";
	else
		apt-get -y install "$app";
	fi
done

