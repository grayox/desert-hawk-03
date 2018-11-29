#!/bin/bash
#
# Copy files and directories to upgraded version

#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   

# copy list of files to xfer, store them in a temp file in the dest directory
cp v$old/$localpath/xfer.txt v$new/files-to-xfer-temp.txt

# navigate to destination directory
cd v$new
# rename certain files in destination directory
# ref: https://unix.stackexchange.com/a/481334/167174
while read ; do mv "$REPLY" "${REPLY%.js}-orig.js" ; done < files-to-xfer-temp.txt
# cleanup
rm files-to-xfer-temp.txt

# navigate to source directory
cd ../v$old
# copy files listed in xfter.txt from source then paste to destination directories
# ref: https://unix.stackexchange.com/a/481043/167174
cpio -u --create < $localpath/xfer.txt | (cd ../v$new && cpio --extract)

# navigate back to parent directory
cd ..

#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   
#
#   COPY DIRECTORIES
#
#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   
# create destination directories
# mkdir v$new/src/my-app/
# mkdir v$new/src/store/actions/my-actions
# mkdir v$new/src/store/reducers/my-reducers
# # copy directories
# cp -r v$old/src/my-app/ v$new/src/my-app/
# cp -r v$old/src/store/actions/my-actions v$new/src/store/actions/my-actions
# cp -r v$old/src/store/reducers/my-reducers v$new/src/store/reducers/my-reducers
# INSTRUCTIONS FOR COPYING DIRECTORIES AND CONTENTS
# mkdir v03/src/store/actions/my-actions && mkdir v03/src/store/reducers/my-reducers
# # adds folder to destination (because it does NOT have a trailing slash behind the source directory '/')
# cp -r v01/src/store/actions/my-actions v03/src/store/actions/my-actions && cp -r v01/src/store/reducers/my-reducers v03/src/store/reducers/my-reducers
# cp -r v01/src/store/actions/my-actions v03/src/store/actions/my-actions/ && cp -r v01/src/store/reducers/my-reducers v03/src/store/reducers/my-reducers/
# # does NOT add a folder to destination (because it has trailing slash behind the source directory '/')
# cp -r v01/src/store/actions/my-actions/ v03/src/store/actions/my-actions && cp -r v01/src/store/reducers/my-reducers/ v03/src/store/reducers/my-reducers
# # a trailing slash behind the source directory means only the directory contents are copied not the directory itself
# # the trailing slash makes a `mkdir` command necessary prior to the `cp` command
# # to do the copy paste in a single command, omit the trailing slash from the source directory in the `cp` command as follows
# cp -r v01/src/store/actions/my-actions v03/src/store/actions/my-actions && cp -r v01/src/store/reducers/my-reducers v03/src/store/reducers/my-reducers
# # the following lines correctly implement the `cp` command to copy the directory contents and the directory itself

# define variables
old=$1
new=$2
localpath=$3
# remoterepo=$4

# remoterepo=$4# copy directories
cp -r v$old/src/my-app v$new/src/my-app
cp -r v$old/src/store/actions/my-actions v$new/src/store/actions/my-actions
cp -r v$old/src/store/reducers/my-reducers v$new/src/store/reducers/my-reducers

#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   

# make this script executable for next run
chmod a+x v$new/$localpath/copy.sh