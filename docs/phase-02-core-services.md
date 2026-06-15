# Phase 2 - Core Services Checklist

## Systemd Fundamentals

### Learn

* [x] What a service is
* [x] What a target is
* [x] What a timer is
* [x] What happens during boot

### Commands

* [ ] systemctl status
* [ ] systemctl start
* [ ] systemctl stop
* [ ] systemctl restart
* [ ] systemctl enable
* [ ] systemctl disable
* [ ] systemctl list-units
* [ ] systemctl list-unit-files

### Exercises

* [ ] Enable a service
* [ ] Disable a service
* [ ] Create a custom service
* [ ] Create a custom timer

## Logging

### Learn

* [ ] How journald works
* [ ] Boot logs
* [ ] Service logs
* [ ] Log filtering

### Commands

* [ ] journalctl -b
* [ ] journalctl -u SERVICE
* [ ] journalctl -p warning
* [ ] journalctl -f

### Exercises

* [ ] View logs from current boot
* [ ] View logs from previous boot
* [ ] Debug a failing service

## Networking

### Learn

* [x] Network interfaces
* [x] IP addresses
* [x] DNS
* [x] Routing

### Commands

* [x] ip addr
* [x] ip route
* [x] ping
* [x] ss
* [ ] resolvectl

### Exercises

* [ ] Inspect current network configuration
* [ ] Verify DNS resolution
* [ ] Troubleshoot a broken connection

## SSH

### Install

* [x] openssh

### Learn

* [x] SSH client
* [x] SSH server
* [x] Authentication
* [x] Host keys

### Exercises

* [x] Connect locally
* [x] Connect from another machine
* [x] Use SSH keys
* [x] Disable password authentication
* [x] Generate an SSH key
* [x] Install the key
* [x] Login without a password
* [x] Use scp to transfer a file

## Users And Permissions

### Learn

* [x] Users
* [x] Groups
* [x] Ownership
* [x] Permissions

### Commands

* [ ] useradd
* [ ] usermod
* [ ] passwd
* [ ] chmod
* [ ] chown
* [ ] id

### Exercises

* [ ] Create a user
* [ ] Create a group
* [ ] Share files through a group
* [ ] Restrict access to a file

## Package Management

### Learn

* [x] Package installation
* [x] Package removal
* [x] Package updates
* [x] Package queries

### Commands

* [x] pacman -S (install)
* [x] pacman -R (remove)
* [x] pacman -Rns (remove + config files + dependencies)
* [x] pacman -Syu (sync + refresh database + upgrade)
* [x] pacman -Ss (search)
* [x] pacman -Qi (query info)
* [x] pacman -Ql (query contents)
* [x] pacman -Qdt (query orphaned dependencies)

### Exercises

* [x] Install packages
* [x] Remove packages
* [x] Investigate package contents

## Storage

### Learn

* [ ] Mount points
* [ ] Filesystems
* [ ] Btrfs basics

### Commands

* [ ] lsblk
* [ ] mount
* [ ] findmnt
* [ ] df
* [ ] du

### Exercises

* [ ] Mount a filesystem manually
* [ ] Inspect Btrfs information
* [ ] Analyze disk usage

## Processes

### Learn

* [ ] Processes
* [ ] Signals
* [ ] Foreground vs background jobs

### Commands

* [ ] ps
* [ ] top
* [ ] kill
* [ ] killall
* [ ] jobs
* [ ] bg
* [ ] fg

### Exercises

* [ ] Kill a process
* [ ] Suspend a process
* [ ] Run background jobs

## Monitoring Tools

### Install

* [ ] htop
* [ ] btop
* [x] tree
* [ ] lsof
* [ ] strace

### Learn

* [ ] CPU monitoring
* [ ] Memory monitoring
* [ ] Open files
* [ ] System calls

## Filesystem Hierarchy

### Explore

* [ ] /etc
* [ ] /usr
* [ ] /var
* [ ] /home
* [ ] /boot
* [ ] /proc
* [ ] /sys
* [ ] /run

### Goal

Understand why each directory exists.

## Phase Completion

The system should be manageable entirely from a TTY.

Success Criteria:

* [ ] Network works reliably
* [x] SSH works
* [ ] Services can be managed confidently
* [ ] Logs can be inspected and understood
* [x] Package management is understood
* [ ] Users and permissions are understood
* [ ] Common problems can be diagnosed without a GUI
