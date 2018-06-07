# Zabbix monitoring of aTech Media Postal processes

This project is composed by a shell script, a Zabbix template and a sudoers configuration file:
- The shell script reads values from `postal status` command and sends it to the Zabbix Server via Agent.
- The template has items that receives those values and activates triggers.
- The sudoers configuration is needed to execute `postal status` command with privileges to read the status.
This repository was created using Zabbix 3.4.9 and [Postal](https://github.com/atech/postal) at 2017 December 5th version, in a GNU/Linux CentOS 7 OS.

### Features

- Get server start time.
- Get processes (web, fast, workers, cron, smtp and requeuer) status, as informed in `postal status` command
- Receive an alert if any process status is different from `Running`.

### Features planned
- Get a process number of respawns, to send alerts if it's greater than zero.
- Process respawn trigger.
- Process discovery_rules, to automatically add processes to zabbix if we add more processes to postal (like more workers).

### Installation

1. Download the necessary files or clone this project anywhere zabbix user can access. It's configured by default in `/etc/zabbix/lib/postal-zabbix`, but you can place it anywhere you want that zabbix user has access.

2. Put `zabbix-agentd.d/postal-zabbix.conf` in zabbix agent directory, normally `/etc/zabbix/zabbix-agentd.d/`. Edit this file if you don't use the default `/etc/zabbix/lib/postal-zabbix` folder.

3. Put `sudoers.d/zabbix_postal` in the sudoers folder, normally `/etc/sudoers.d`. Edit this file if you don't use default folders.

4. Now restart the Zabbix agent service.

5. Import `template/postal-template.xml` in Zabbix and assign it to your postal server host.

### Feedback

Feel free to send bug reports and feature requests. If you are using this solution in production, please tell me to know it's being useful.
