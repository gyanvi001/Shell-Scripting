# Shell-Scripting
**Basic Linux Commands **

•	ls, cd, pwd, mkdir, rm, cp, mv 
•	touch, cat, less, head, tail 
•	chmod, chown, stat 
•	df, du, top, htop, free, uptime 

*************************************************************************************************
# Linux Basic Commands Cheat Sheet

##  File & Directory Navigation

| Command | Description |
|---------|-------------|
| `ls` | List files and directories |
| `ls -l` | Long listing format |
| `ls -a` | Show hidden files |
| `cd [dir]` | Change directory |
| `pwd` | Show current directory path |

##  File & Directory Management

| Command | Description |
|---------|-------------|
| `mkdir [dir]` | Create directory |
| `rm [file]` | Remove file |
| `rm -r [dir]` | Remove directory recursively |
| `rm -rf [dir]` | Force remove directory |
| `cp [src] [dest]` | Copy file |
| `cp -r [src_dir] [dest]` | Copy directory |
| `mv [src] [dest]` | Move/rename file or directory |

##  File Creation & Viewing

| Command | Description |
|---------|-------------|
| `touch [file]` | Create empty file |
| `cat [file]` | Display file content |
| `less [file]` | Scrollable view of file content |
| `head [file]` | First 10 lines of a file |
| `head -n 20 [file]` | First 20 lines |
| `tail [file]` | Last 10 lines of a file |
| `tail -f [logfile]` | Live monitor log file |

##  Permissions & Ownership

| Command | Description |
|---------|-------------|
| `chmod 755 [file]` | Set file permissions |
| `chmod +x [script.sh]` | Make file executable |
| `chown user:group [file]` | Change file owner and group |
| `stat [file]` | Show file details |

##  System Monitoring

| Command | Description |
|---------|-------------|
| `df -h` | Disk space usage (human readable) |
| `du -sh [dir]` | Disk usage of directory |
| `top` | Real-time process monitor |
| `htop` | Enhanced interactive process viewer |
| `free -h` | Memory usage info |
| `uptime` | System uptime and load average |
