#!/bin/bash
#
# Clone latest version of remote repo to local

#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   

# define variables
old=$1
new=$2
localpath=$3
# remoterepo=$4

# make this script executable for next run
chmod a+x v$new/$localpath/clone.sh
