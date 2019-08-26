#!/bin/bash
ps -ef | grep insert.py  | grep -v grep | awk '{print $2}' | xargs kill
/usr/bin/python /home/deploy/mcsoh/insert.py
