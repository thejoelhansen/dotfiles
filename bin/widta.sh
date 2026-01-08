#!/bin/bash

## Wait I did that already
## Script to keep tabs on customizations that seem to dissappear cuz ghosts
##

## Typography
# ⚙
# →
# ⚠
# ❑
# ☑

## TEMPLATE
### --- Check description
# echo ⚙ "Checking blah"
# command to check blah
#if [ $? != 0 ]; then
#	number_of_problems+=$(printf '%s' "$error")$'\n'
#	error="→ Oh no... "$?" services reporting need to restart"
#fi

number_of_problems="⚠ DANGIT:"

### --- Check ReBAR/SAM

echo ⚙ "Checking if ReBAR/SAM is enabled..."

# Get PCI bus ID of GPU
pci_bus_id=$(lspci | grep -i 'vga' | head -n 1 | sed -E 's/^([0-9a-fA-F:.]+).*/\1/')

# Get the PCI vendor ID
vendor_id=$(lspci -n -s "$pci_bus_id" | awk '{print $3}' | cut -d: -f1)

# Determine correct BAR number based on vendor
case "$vendor_id" in
    1002)
        vendor="amd"
        bar_num=0
        ;;
    10de)
        vendor="nvidia"
        bar_num=1
        ;;
    8086)
        vendor="intel"
        bar_num=2
        ;;
    *)
        echo "Unknown vendor ID: $vendor_id"
        exit 1
        ;;
esac

# Get BAR info and current size
bar_info=$(sudo lspci -s "$pci_bus_id" -vv | grep -i "BAR $bar_num" | grep -i "current size")

# Separate BAR value from BAR units
size_value=$(echo "$bar_info" | sed -E 's/.*current size: ([0-9]+)([MG]B).*/\1/')
size_unit=$(echo "$bar_info" | sed -E 's/.*current size: ([0-9]+)([MG]B).*/\2/')

# Convert size to MB
if [[ "$size_unit" == "GB" ]]; then
  bar_value=$((size_value * 1024))
else
  bar_value=$size_value
fi

# Ensure BAR in MB is greater than 1GB
if [ "$bar_value" -lt 1024 ]; then
	number_of_problems+=$(printf '%s' "$error")$'\n'
	error="→ Oh no... "$?" bar-a-rino is a lil boi, only $bar_value"
else
	echo "$bar_num size: ${bar_value}MB - prolly fine"
fi

### --- Finally, check for pending reboots

echo ⚙ "Checking for restarts..."

needs-restarting -r ; echo $? 'services reporting need to restart'

if [ $? != 0 ]; then
	number_of_problems+=$(printf '%s' "$error")$'\n'
	error="→ Oh no... "$?" services reporting need to restart"	
fi

# Report all $number_of_problems
if [ "$number_of_problems" = "⚠ DANGIT:" ];then
	printf $'\n'
	echo ☑ "Probably fine"
	printf $'\n'
else
	printf $'\n'
	printf '%s' "$number_of_problems"
	printf $'\n'
fi
