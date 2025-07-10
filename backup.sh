#!/bin/sh

echo "Backup Script"
echo "This script creates a backup of the specified directory and saves it to a backup location."
# echo $1
# echo $2

SOURCE="$1"
Backup_dir="$2"
BackUp_File="$Backup_dir/backup_$(date +%Y%m%d_%H%M%S).tar.gz"


mkdir -p "$Backup_dir"

if [ -d "$SOURCE" ]; then
    echo "Backing up directory: $SOURCE"
    tar -czf "$BackUp_File" -C "$SOURCE" .
    echo "Backup created at: $BackUp_File"
else
    echo "Error: Source directory : $SOURCE does not exist."
    exit 1
fi
