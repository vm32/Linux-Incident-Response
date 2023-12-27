# Linux Incident Response

This repository contains a comprehensive cheatsheet for incident response and live forensics in Linux environments. It's designed to help system administrators, security professionals, and IT staff quickly reference commands and procedures during an incident.

## How to Use
Navigate through the sections to find relevant commands for different aspects of incident response. Each command is accompanied by a brief description of its purpose and usage.

## Table of Contents
- [User Accounts](#user-accounts)
- [Log Entries](#log-entries)
- [System Resources](#system-resources)
- [Processes](#processes)
- [Services](#services)
- [Files](#files)
- [Network Settings](#network-settings)

### User Accounts
Commands for investigating user activities, permissions, and unusual activities.
- `cat /etc/passwd` - List user accounts.
- `passwd -S [User_Name]` - Check password status for a user.
- `lastlog` - Show the most recent logins.
- `last` - Show last logged in users.
- `who` - Show who is logged on.
- `w` - Show who is logged on and what they are doing.

### Log Entries
Commands for reviewing system and application logs.
- `cat /var/log/messages` - Show system messages.
- `cat /var/log/auth.log` - Show user authentication logs.
- `cat /var/log/secure` - Show authentication log for Red Hat based systems.
- `cat /var/log/boot.log` - Show system boot log.
- `cat /var/log/dmesg` - Show kernel ring buffer log.
- `cat /var/log/kern.log` - Show kernel log.

### System Resources
Commands to check system performance and resource usage.
- `top` - Display Linux tasks.
- `htop` - Interactive process viewer.
- `uptime` - Show system uptime.
- `ps aux` - Show currently running processes.
- `pstree` - Show running processes as a tree.
- `free -m` - Show memory usage in MB.

### Processes
Commands for investigating running processes.
- `ps -ef` - Display all the currently running processes on the system.
- `pstree -p` - Display processes in a tree format with PIDs.
- `top -n 1` - Display top processes.
- `ps -eo pid,tt,user,fname,rsz` - Show processes in custom format.
- `lsof -i` - List open files associated with network connections.

### Services
Commands to inspect services running on the system.
- `chkconfig --list` - List all services and their current states.
- `service --status-all` - Show status of all services.
- `systemctl list-units --type=service` - List running services (systemd).

### Files
Commands for file investigation.
- `ls -alh` - Show all files in human-readable format.
- `find / -name [filename]` - Find a specific file.
- `find / -mtime -[N]` - Find files modified in the last N days.
- `find / -atime -[N]` - Find files accessed in the last N days.
- `find / -size +[N]c` - Find files larger than N bytes.

### Network Settings
Commands for reviewing network configurations and connections.
- `ifconfig -a` - Show all network interfaces.
- `netstat -antup` - Show active network connections.
- `iptables -L -n -v` - Show all iptables rules.
- `route -n` - Show routing table.
- `ss -tuln` - Show listening ports and established connections.

## Contribution
Contributions to this cheatsheet are welcome. Please submit a pull request or open an issue for suggestions.
