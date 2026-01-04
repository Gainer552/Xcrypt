#!/bin/bash
echo

# Description
echo "Xcrypt is a simple and secure bash script designed to provide AES-256 bit encryption for raw partitions on Arch Linux. 
It ensures your data is fully protected with byte-by-byte encryption, securing the entire device at the block level. 
With a straightforward passphrase-based unlocking process, Xcrypt makes it easy to encrypt, mount, and safely manage encrypted 
partitions, giving you peace of mind that your sensitive data is always protected. Press CTRL + C to exit."
echo
#sleep 15s

echo "Warning: Xcrypt is a powerful tool that directly encrypts raw partitions on your system. 
By using this program, you acknowledge that any data on the encrypted partition will be erased during the encryption process. 
The developer is not responsible for any data loss, system failures, or other unintended consequences that may occur while 
using this tool. Please ensure that you have a complete backup of any important data before proceeding. 
Use Xcrypt at your own risk, and ensure you fully understand the encryption process before applying it to any device."
echo
#sleep 15s

# Shows all available partitions.
echo "Will display all partitions visible on system in 5 seconds."
echo
#sleep 5s
lsblk
echo
#sleep 15s

while true; do
	echo "1) Unmount a partition."
	echo "2) Encrypt partition."
	echo
	read -p "Please select an option to begin: " selection
	echo

	case $selection in
		1)
			read -p "Which device would you like to unmount? " device
			if [[ ! -b "$device" ]]; then
				echo "Device not found. Please try again."
				echo
				continue
			fi

			# Unmount all mounted partitions on the device.
			mountpoints=$(lsblk -ln -o MOUNTPOINT "$device" | grep -v '^$')
			if [[ -z "$mountpoints" ]]; then
				echo "Device is not mounted."
			else
				unmount_failed=0
			while read -r mp; do
    			if ! sudo umount "$mp"; then
        		echo "Failed to unmount $mp (device may be busy)"
        		unmount_failed=1
    			fi
			done <<< "$mountpoints"
				if [[ "$unmount_failed" -eq 0 ]]; then
    			echo "Device has been unmounted!"
			else
    			echo "One or more mount points could not be unmounted."
    			echo "Make sure no files are in use and try again."
				fi
			fi
			echo
			;;
		2)
			read -p "Would you like to encrypt this device with AES-256 bit encryption and add a password? (y/n): " answer
			if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
				echo
				echo "Encryption process started!"
				echo

				read -p "Enter the name of the device you'd like to encrypt: " device
				echo

				if [[ ! -b "$device" ]]; then
					echo "Device does not exist or access denied."
					echo
					continue
				fi

				size=$(blockdev --getsize64 "$device" 2>/dev/null)
				if [[ -z "$size" || "$size" -eq 0 ]]; then
					echo "Device has no media present (likely ejected). Please reinsert the device."
					echo
					continue
				fi

				if sudo cryptsetup isLuks "$device" >/dev/null 2>&1; then
					echo "Error: Device is already encrypted"
					echo
					continue
				fi

				echo "Launching secure password prompt..."
				echo

				if sudo cryptsetup luksFormat --cipher aes-xts-plain64 --key-size 256 "$device"; then
					echo
					echo "Device has been encrypted! Enjoy NSA grade security! :)"
					echo

					# Open, format, and mount.
					mapper_name="xcrypt_usb"
					mount_point="/mnt/xcrypt"

					sudo cryptsetup open "$device" "$mapper_name" || continue
					sudo mkfs.ext4 "/dev/mapper/$mapper_name" || continue
					sudo mkdir -p "$mount_point"
					sudo mount "/dev/mapper/$mapper_name" "$mount_point"

					echo "Filesystem created and mounted at $mount_point"
					echo
				else
					echo
					echo "Encryption failed! :("
					echo
				fi
			else
				echo "Encryption aborted."
				echo
			fi
			;;
	esac
done