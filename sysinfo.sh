#!/bin/sh
# This script collects system information and outputs it in a structured format.
# Usage: ./sysinfo.sh

echo "System Information:"
echo "-------------------"
echo "Current User: $(whoami)"
echo "Hostname: $(hostname)"
echo "Operating System: $(uname -s)"
echo "CPU Cores: $(lscpu | grep '^CPU(s):')"
echo "CPU Core using nproc: $(nproc)"
echo "RAM Size : $(free -h | grep '^Mem:')"
#cat /proc/meminfo
# Read memory values in kB from /proc/meminfo
mem_total_kb=$(grep MemTotal /proc/meminfo | awk '{print $2}')
mem_free_kb=$(grep MemFree /proc/meminfo | awk '{print $2}')
mem_available_kb=$(grep MemAvailable /proc/meminfo | awk '{print $2}')

# Convert kB to GB
mem_total_mb=$((mem_total_kb / 1024/1024))
mem_free_mb=$((mem_free_kb / 1024/1024))
mem_available_mb=$((mem_available_kb / 1024/1024))

# Display results
echo "Total Memory:     ${mem_total_mb} GB"
echo "Free Memory:      ${mem_free_mb} GB"
echo "Available Memory: ${mem_available_mb} GB"


echo "Used memory : $(free -h | grep '^Mem:' | awk '{print $3}') GB"