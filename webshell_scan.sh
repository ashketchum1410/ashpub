#!/bin/bash

# Define the directory to search for PHP files
directory="/home/econecta/"

# Define the output file to save the results
output_file="webshell_scan_results.txt"

# Array of common web shell patterns
webshell_patterns=(
    "eval"
    "base64_decode"
    "system"
    "shell_exec"
    "\$_POST"
    "\$_GET"
    "\$_REQUEST"
    "assert"
    "preg_replace"
    "passthru"
    "popen"
    "proc_open"
    "error_reporting(0)"
    "@ini_set"
)

# Create an empty file to store the scan results
> "$output_file"

# Loop through the web shell patterns and search for them in PHP files
for pattern in "${webshell_patterns[@]}"; do
    echo "Scanning for $pattern..."
    grep -rnw "$directory" -e "$pattern" --include "*.php" >> "$output_file"
done

echo "Web shell scan completed. Results saved in $output_file."

