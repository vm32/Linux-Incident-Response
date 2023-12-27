
#!/bin/bash

# Redirecting output to IRLinux.txt in /tmp/ directory
exec > /tmp/IRLinux.txt 2>&1

echo "Incident Response Linux Investigation"
echo "--------------------------------------"
echo "Date and Time of Report: $(date)"
echo "--------------------------------------"

# Function to print section headers
print_section() {
    echo ""
    echo "======================================"
    echo "$1"
    echo "======================================"
}

# User Accounts
print_section "User Accounts Information"
echo "Listing user accounts..."
cat /etc/passwd
echo "Checking password status for a user (Placeholder)..."
passwd -S [User_Name]
echo "Showing the most recent logins..."
lastlog
echo "Showing last logged in users..."
last
echo "Showing who is logged on..."
who
echo "Showing who is logged on and what they are doing..."
w

# Additional User Account Commands
print_section "Additional User Account Commands"
echo "Finding root accounts..."
grep :0: /etc/passwd
echo "Finding files with no user..."
find / -nouser -print
echo "Viewing encrypted passwords and account expiration information..."
cat /etc/shadow
echo "Viewing group information..."
cat /etc/group
echo "Viewing sudoers file..."
cat /etc/sudoers

# Log Entries
print_section "Log Entries"
echo "Showing system messages..."
cat /var/log/messages
echo "Showing user authentication logs..."
cat /var/log/auth.log
echo "Showing authentication log for Red Hat based systems..."
cat /var/log/secure
echo "Showing system boot log..."
cat /var/log/boot.log
echo "Showing kernel ring buffer log..."
cat /var/log/dmesg
echo "Showing kernel log..."
cat /var/log/kern.log
echo "Viewing the last few entries in the authentication log..."
tail /var/log/auth.log
echo "Viewing command history..."
history | less

# System Resources
print_section "System Resources"
echo "Displaying Linux tasks..."
top -b -n 1
echo "Interactive process viewer..."
htop -n 1
echo "Showing system uptime..."
uptime
echo "Showing currently running processes..."
ps aux
echo "Showing running processes as a tree..."
pstree
echo "Displaying memory usage..."
free -m
echo "Displaying memory information..."
cat /proc/meminfo
echo "Displaying mounted filesystems..."
cat /proc/mounts

# Processes
print_section "Processes"
echo "Displaying all the currently running processes on the system..."
ps -ef
echo "Displaying processes in a tree format with PIDs..."
pstree -p
echo "Displaying top processes..."
top -b -n 1
echo "Showing processes in custom format..."
ps -eo pid,tt,user,fname,rsz
echo "Listing open files associated with network connections..."
lsof -i
echo "Listing open files for a process (Placeholder)..."
lsof -p [pid]

# Services
print_section "Services"
echo "Listing all services and their current states..."
chkconfig --list
echo "Showing status of all services..."
service --status-all
echo "Listing running services (systemd)..."
systemctl list-units --type=service
echo "Listing all services and their status..."
service --status-all

# Files
print_section "Files"
echo "Showing all files in human-readable format..."
ls -alh
echo "Finding a specific file (Placeholder)..."
find / -name [filename]
echo "Finding files modified in the last N days (Placeholder)..."
find / -mtime -[N]
echo "Finding files accessed in the last N days (Placeholder)..."
find / -atime -[N]
echo "Finding files larger than N bytes (Placeholder)..."
find / -size +[N]c

# Network Settings
print_section "Network Settings"
echo "Showing all network interfaces..."
ifconfig -a
echo "Showing active network connections..."
netstat -antup
echo "Showing all iptables rules..."
iptables -L -n -v
echo "Showing routing table..."
route -n
echo "Showing listening ports and established connections..."
ss -tuln

# Additional Commands
print_section "Additional Investigation Commands"
echo "Viewing the cron table for scheduled tasks..."
cat /etc/crontab
echo "Viewing DNS settings..."
more /etc/resolv.conf
echo "Viewing host file entries..."
more /etc/hosts
echo "Listing all iptables rules without resolving IP addresses..."
iptables -L -n
echo "Finding files larger than 512KB in home directories..."
find /home/ -type f -size +512k -exec ls -lh {} \;
echo "Finding readable files in the etc directory..."
find /etc/ -readable -type f 2>/dev/null
echo "Finding files modified in the last 2 days..."
find / -mtime -2 -ls
echo "Showing network connections and associated programs..."
netstat -nap
echo "Viewing the ARP table..."
arp -a
echo "Displaying the PATH environment variable..."
echo $PATH

echo "--------------------------------------"
echo "Script execution completed."
