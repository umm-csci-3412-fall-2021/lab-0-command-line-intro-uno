#!/usr/bin/bash

# sysinfo_page - This script extracts gunzipped tar files and removes any instance of "DELETE ME!"

archive=$1 #This "archive" variable will serve as an argument for big_clean.sh to inspect.

tempDir=$(mktemp -d) #tempDir will serve as the place for storing a "scratch" directory for storing the
                                     #contents of the tar archive to be inspected.

tar -xzf $archive -C $tempDir #The tar command will extract the inputted archive into the temporary directory
			      #that is created.
