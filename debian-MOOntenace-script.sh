#!/bin/bash
log=/var/log/scheduled-maintenance.log
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Starting Weekly Maintenance..." | cowsay >> $log
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Updating Repos..." | cowsay >> $log
apt-get update >> $log 2>&1
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Downloading & Installing Updates..." | cowsay >> $log
apt-get upgrade -y >> $log 2>&1
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Removing Unused Dependencies..." | cowsay >> $log
apt-get autoremove -y >> $log 2>&1
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Clearing Apt Cache..." | cowsay >> $log
apt-get clean >> $log 2>&1
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Rebooting..." | cowsay >> $log
/sbin/reboot >> $log 2>&1