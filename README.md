# xenserver-scripts
Bash scripts for xcp-ng hypervisor
* _host-backup_ - backup pool metadata, host and some config files
* _vm-backup_ - suspend vm, then backup it and resume
* _sms_sms.ru_ - send text sms via http://sms.ru
* _mount\_usb-hdd_
* _copy-backups_
* _nc-receive-group_
* _nc-send-group_
* _weekly-vm-backup_ weekly-vm-backup.cron
* _update_

common-func.sh config.example

You need to install nmap-ncat package in xcp-ng in order to nc-* scripts to work:

```shell
# yum install nmap-ncat
```

Download to xcp-ng host:

```shell
# cd /root
# wget -O - https://raw.githubusercontent.com/ruslan-ohitin/xenserver-scripts/master/update | bash
```
