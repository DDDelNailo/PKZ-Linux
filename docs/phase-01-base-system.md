# Phase 01 - Base System

## Objective

Install a functional Arch Linux system manually and understand every installation step.

## System Information

Date: 10/06/2026

Virtual Machine: VirtualBox, 4 CPU Cores, 4 GB RAM, 40 GB Dynamic VDI

Arch ISO Version: archlinux-2026.06.01-x86_64

Host Machine: 11th Gen Intel Core i3-1115G4, RAM: 20GB, Storage: 256GB

## Installation Decisions

### Boot Mode

Chosen: UEFI

Reason: Modern standard supported by virtually all current hardware.

Alternative Considered: Legacy BIOS.

### Partition Layout

Chosen: 512 MB EFI System Partition + Remaining Space for Linux

Reason: Simple layout suitable for a personal desktop system.

Diagram:

```
/dev/sda
├─ EFI Partition (512 MB)
└─ Linux Partition (Remaining Space)
```

### Filesystem

Chosen: Btrfs

Reason: Snapshot support, compression, checksums, modern features.

Advantages:
- Snapshots
- Compression
- Data integrity features

Disadvantages:
- More complex than ext4

### Bootloader

Chosen: systemd-boot

Reason: Simple UEFI bootloader integrated with systemd.

Alternative Considered: GRUB.

## Installation Log

### Verify Boot Mode

Command: `ls /sys/firmware/efi`

Result: UEFI directory present.

Why This Step Exists: Confirms the system booted in UEFI mode.

### Verify Network

Command: `ping archlinux.org`

Result: Network connectivity confirmed.

Why This Step Exists: Packages will be downloaded from Arch repositories.

### Partition Disk

Command: `fdisk /dev/sda`

Created:
- EFI System Partition (512 MB)
- Linux Partition (remaining space)

Why This Step Exists: The EFI partition stores bootloader files. The Linux partition stores the operating system and user data.

Partition Table: GPT

Notes: GPT was chosen because the system boots using UEFI.

### Create Filesystems

EFI Partition: `mkfs.fat -F32 /dev/sda1`

Filesystem: FAT32

Purpose: Required for UEFI booting.

Linux Partition: `mkfs.btrfs /dev/sda2`

Filesystem: Btrfs

Purpose: Stores the operating system and user data.

Why Btrfs:
- Snapshots
- Compression
- Modern Linux filesystem features

### Mount Filesystems

Commands:
 - `mount /dev/sda2 /mnt`
 - `mkdir -p /mnt/boot`
 - `mount /dev/sda1 /mnt/boot`

Why This Step Exists:

The installer needs a target location where the new system will be installed.

Mount Layout:

```
/mnt
└── boot
    └── EFI partition
```

### Install Base System

Command: `pacstrap -K /mnt base linux linux-firmware btrfs-progs networkmanager sudo vim`

| Package        | Why                    |
| -------------- | ---------------------- |
| base           | Minimal Arch userspace |
| linux          | Kernel                 |
| linux-firmware | Hardware firmware      |
| btrfs-progs    | Btrfs tools            |
| networkmanager | Networking             |
| sudo           | Administrative access  |
| vim            | Editor                 |


### Generate Fstab

Command: `genfstab -U /mnt >> /mnt/etc/fstab`

Purpose: Creates the filesystem table used during boot.

What Fstab Does: Tells Linux which partitions should be mounted and where they should appear in the filesystem.

### Chroot

Command: `arch-chroot /mnt`

Purpose: Temporarily enter the installed system before the first boot.

Explanation: Allows configuration of the new system as if it had already booted.

### Timezone

Commands:
 - `ln -sf /usr/share/zoneinfo/America/Fortaleza /etc/localtime`
 - `hwclock --systohc`

Reason: Matches local time.

Purpose: Ensures logs, schedules, and timestamps use the correct timezone.

### Locale

Enabled:
- en_US.UTF-8
- pt_BR.UTF-8

Purpose: Controls language and character encoding.

### Keyboard Layout

Chosen: br-abnt2

Reason: Matches physical keyboard layout.

Configuration File: `/etc/vconsole.conf`

### Hostname

Chosen: `pkz-lab`

Reason: Primary development and experimentation environment for PKZ Linux.

Alternative Considered: `pkz-linux`

Decision: Hostnames identify machines, not distributions.

### Create User

Username: `del`

Groups: `wheel`

Purpose: Daily usage should occur through a normal user account rather than root.

### User Groups

`wheel`

Purpose: Administrative group used to grant sudo privileges.

Why It Was Chosen: Allows the normal user account to perform system administration tasks without logging in directly as root.

Alternative: Use the root account directly.

Tradeoff: Requires sudo configuration but improves security and follows standard Linux practices.

### NetworkManager

Enabled: `systemctl enable NetworkManager`

Purpose: Provides networking automatically during boot.

### Install Bootloader

Bootloader: systemd-boot

Reason: Simple UEFI bootloader integrated with systemd.

Configuration:
loader.conf
- default entry: arch.conf
- timeout: 3 seconds

Kernel Entry: root filesystem identified using UUID.

Purpose: Loads the Linux kernel and passes boot parameters.

## Verification Checklist

* [x] System boots without ISO
* [x] User login works
* [x] Internet works
* [x] Hostname correct
* [x] Timezone correct
* [x] Locale correct

## What I Learned

1. Difference between UEFI and BIOS.
2. Purpose of a bootloader.
3. How filesystems are mounted through fstab.
4. Difference between root and normal users.
5. How Linux identifies partitions using UUIDs.
6. How a system becomes bootable.

## Things I Still Don't Understand

1.
2.
3.

## Future Improvements

1.
2.
3.
