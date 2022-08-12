# xenserver-scripts
Bash scripts for XenServer
* _host-backup_ - backup pool metadata, host and some config files
* _vm-backup_ - suspend vm, then backup it and resume
* _xsupdate_ - install patch from zip or xsupdate file
* _sms_sms.ru_ - send text sms via http://sms.ru

You need to install netmap-netcat package in order to nc-* scripts to work.

Download to xen host:

wget -O - https://raw.githubusercontent.com/ruslan-ohitin/xenserver-scripts/master/update | bash
