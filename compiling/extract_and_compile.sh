#!/usr/bin/bash

# sysinfo_page - This script extracts and compiles a C program known as "NthPrime."

prime = $1 #This variable takes in the prime that NthPrime will use to find the correct Nth prime.

tar -xzf NthPrime.tgz #Meanwhile, this command extracts the tar file with respect to a gunzipped format, along with its name.

cd NthPrime || exit #On the other hand, this command will "cd" into a directory created via the extraction of the NthPrime file.
                    #If this operation were to fail, the directory will be exited.

gcc ./*.c -o NthPrime #After entering the directory, the NthPrime program will be compiled and be able to output from an executable
                      #called "NthPrime"

./NthPrime "$prime" #This passes any number specified in the prime variable into the program, allowing for NthPrime to compute the Nth prime.
