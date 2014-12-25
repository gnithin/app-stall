pp-stall


**app-stall** is bash script that can be used to install a list of applications specified in a file.
To execute it, you need to run this command in the bash -

```
sudo ./script.sh
```

You need to use sudo, because installation requires super-user privileges.
And that's it, all the applications listed in apps_list.txt will be installed.

Here is a functioning example -
```
nithin@nithin-Inspiron-1525:~/code/init_script$ sudo ./script.sh
[sudo] password for nithin:
***** Installing filezilla *****
Reading package lists... Done
Building dependency tree
Reading state information... Done
...
```

