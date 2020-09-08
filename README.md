#### ansible-octo-doodle
------------------------

- Adhoc commands:

        Syntax:

        ansible <host-name/group-name> -b -i <inventory file path> -m <module>
        ansible nfs_server -b -i hostInventory.yaml -m copy -a "src=./exports dest=/etc/exports"
        ansible nfs_server -i hostInventory.yaml -a "ls -alstr /etc/exports"
        
        Note: 
        "-b" is used to execute commands as esclated user.
        "-a" <"arguments in quotes"> complements with -m or to run a custom shell script with arguments. 