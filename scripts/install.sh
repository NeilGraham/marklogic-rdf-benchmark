#!/bin/bash

# Get script directory
DIR="$(cd -- "$(dirname -- "$0")" && pwd)"

# Change directory to `.installs`
cd $DIR/../.installs

# Check if the script is running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "[!] This script must be run with root privileges. Use sudo to run the script:"
    echo "sudo $0 $@"
    exit 1
fi

# Install sparql.anything 0.8.1 from GitHub release page
# Only install if file does not exist
if [ ! -f $DIR/../.installs/sparql-anything-0.8.1.jar ]; then
    echo "[+] Downloading 'sparql-anything-0.8.1.jar'"
    wget https://github.com/SPARQL-Anything/sparql.anything/releases/download/v0.8.1/sparql-anything-0.8.1.jar
    echo "[$] Successfully installed 'sparql-anything-0.8.1'"
else
    echo "[=] 'sparql-anything-0.8.1.jar' already installed"
fi

# Install Marklogic Content Pump 11.0.2 from GitHub release page
# Only install if folder does not exist
if [ ! -d $DIR/../.installs/marklogic-contentpump-11.0.2 ]; then
    echo "[+] Downloading 'marklogic-contentpump-11.0.2'"
    wget https://github.com/marklogic/marklogic-contentpump/archive/refs/tags/11.0.2.zip
    unzip 11.0.2.zip # Unzips into 'marklogic-contentpump-11.0.2'
    rm 11.0.2.zip
    echo "[$] Successfully installed 'marklogic-contentpump-11.0.2'"
else
    echo "[=] 'marklogic-contentpump-11.0.2' already installed"
fi

# Install 'parallel' for popular Linux distributions
# Only install if command does not exist
if command -v parallel >/dev/null 2>&1; then
    echo "[=] 'parallel' already installed"
else
    echo "[+] Installing 'parallel'"
    if [ -f /etc/debian_version ]; then
        apt-get update
        apt-get install parallel
    # Install parallel for Fedora and CentOS
    elif [ -f /etc/fedora-release ] || [ -f /etc/centos-release ]; then
        yum update
        yum install parallel
    # Install parallel for Arch Linux
    elif [ -f /etc/arch-release ]; then
        pacman -Syu
        pacman -S parallel
    # Unsupported distribution
    else
        echo "Error: Unsupported distribution for installing 'parallel'"
        exit 1
    fi
    echo "[$] Successfully installed 'parallel'"
fi

# Adding permissions to all files in '.installs'
echo "[+] Adding permissions to all files in '.installs'"
chmod -R 777 $DIR/../.installs
echo "[$] Successfully added permissions to all files in '.installs'"


wget https://developer.marklogic.com/download/binaries/11.0/MarkLogic-11.0.2-rhel.x86_64.rpm?t=PY/0M0SklPDL2vcR3l7ki.&email=grahamneiln%40gmail.com
