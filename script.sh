#! /bin/bash

#############
#TODO
#----
#DONE	Read arguments
#DONE	Make List of apps
#DONE	Add to file
#DONE	Read from file
#DONE	Make list of applications
#DONE	Update usage and help
#DONE	Make readme file
#DONE	Create options for reading files other than apps_list.txt
#DONE	Check if user is super user or not
#Check if already installed
#find more installables
#make readme better
#Give more examples
#############

#check if super user privileges are set
if [[ $EUID -ne 0 ]]
then
	echo -e "Needs root access to run.Exiting..\nSorry :("
	exit 0
fi

#Usage function prints message when usage error occurs.
usage(){
cat << EOL
Usage Error: 
Valid arguments are -
-f <FILE PATH>
This argument helps sets the apps list file to the filepath indicated in <FILEPATH>.
The default is ./apps_list.txt

-h
Gives information about what apps-stall is, and examples to use it.

-p
This prompts a user before anything is being installed. It is by default turned off(by using the -y argument in apt-get install).
EOL
}

#help function prints message when help is chosen in args.
help(){
cat << EOL
app-stall
---------

app-stall is bash script that can be used to install a list of applications specified in a file.
To execute it, you need to run this command in the bash -

sudo ./script.sh

You need to use sudo, because installations require super-user privileges.
And that's it, all the applications listed in the <apps file> will be installed!

Here is a functioning example -

****************************************************************
nithin@nithin-Inspiron-1525:~/code/init_script$ sudo ./script.sh 
[sudo] password for nithin: 
***** Installing filezilla *****
Reading package lists... Done
Building dependency tree       
Reading state information... Done
...
...
****************************************************************

EOL
}

no_prompt='y'
file_path="./apps_file.txt"

while getopts ":hpf:" opt
do
	case $opt in
		f)
			if [[ -f "$OPTARG" ]]
			then
				file_path="$OPTARG"
			else
				echo "Invalid file path and/or file name"
				exit 1
			fi
			;;
		h)
			help
			exit 2
			;;
		p)
			no_prompt='n'
			;;
		?)
			usage
			exit 3
			;;
	esac
done

declare -a app_names
#reading the file into the array
while read line
do
	res_str=$(grep ^# <<< "$line")
	if [ "$res_str" = "" ]
	then
		app_names=("${app_names[@]}" $line)
	fi
done < "$file_path"


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

