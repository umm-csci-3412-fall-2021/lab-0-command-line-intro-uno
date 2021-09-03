#!/usr/bin/bash

# sysinfo_page - This script extracts gunzipped tar files and removes any instance of "DELETE ME!"

archive=$1 #This "archive" variable will serve as an argument for big_clean.sh to inspect.

scratchDir=$(mktemp -d) #scratchDir will serve as the place for storing a "scratch" directory for storing the
                         #contents of the tar archive to be inspected.

tar -x -z -f $archive --directory $scratchDir #The tar command will extract the inputted archive into the scratch directory
			         #that is created.

mainDir=$(pwd) #mainDir will serve as a fallback to the original directory once the necessary steps are completed.

base=$(basename "$archive" .tgz) #This variable is used to store the name of the original archive, but without the extension. This will hopefully prevent confusion or errors in reading the name.

grep -r -l "DELETE ME!" $scratchDir | xargs rm #Grep will search each file in the scratch directory for "DELETE ME!"
				       	       #After that, xargs will remove every instance of it.

cd $scratchDir #Once the instances are removed, the script will return back to the main scratch directory.

tar -c -z -f "cleaned_$archive" "$base" #A new tar archive will be created with the basename.

mv "cleaned_$archive" "$mainDir" #Said archive will then be moved back to the original directory.
