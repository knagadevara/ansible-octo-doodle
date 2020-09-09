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

- Exception/Error Handeling can be achieved in ansible via 'block' , 'rescue' and 'always' keywords in a task

        syntax:
        
        tasks:
          block:
            - name: task1
              fetch:
                src: "/var/lib/elogger"
                dest: "/share/"
           rescue:
             - debug:
                 msg: " This file dosent exist on any {{ ansible_hostname }} "
           always:
             - debug:
                 msg: "Always run if the execution is success or a failure"