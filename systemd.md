Oh right, it is managed by systemd, which is the Linux OS level manager of process. I did this so it would restart when it died and start automatically on reboot

By the way for you and my edification the systemd file is at 
/etc/systemd/system/mcsoh.service

here is the code.

[Unit]
Description=mcsoh serverice

[Service]
ExecStart=/usr/bin/python  /home/deploy/mcsoh/insert.py
Restart=always
RestartSec=10
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=mcsoh
#User=deploy
#Group=seis-net
[Install]
WantedBy=multi-user.target

