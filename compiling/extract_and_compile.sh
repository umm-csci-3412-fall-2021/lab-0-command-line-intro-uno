#!/usr/bin/bash

# sysinfo_page - This script extracts and compiles a C program.

prime = $1 #Takes in the prime that NthPrime will use to find the correct Nth prime.

tar -xzf NthPrime.tgz #Extracts the tar file.

cd NthPrime || exit
