#app-stall


**app-stall** is bash script that can be used to install a list of applications specified in a file.

###Getting app-stall
Clone the app-stall repo. Use this command -
```
$ git clone https://github.com/gnithin/app-stall.git
```

###Running apps-stall
To execute it, you need to run this command in the bash -

```
$ sudo ./script.sh
```

You need to use sudo, because installation requires super-user privileges.
And that's it, all the applications listed in apps_list.txt will be installed.

Here is a functioning example -
```
$ sudo ./script.sh
[sudo] password for nithin:
***** Installing filezilla *****
Reading package lists... Done
Building dependency tree
Reading state information... Done
...
```
