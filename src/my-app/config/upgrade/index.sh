#!/bin/bash
#
# Config Upgrades
#
# ref: https://www.macs.hw.ac.uk/~hwloidl/Courses/LinuxIntro/x984.html
#
# Usage:
# non-recurring, make it executable
# chmod a+x v03/src/my-app/config/upgrade/index.sh
# run the following each time; in this case, to upgrade from v03 to v04
# ./v03/src/my-app/config/upgrade/index.sh 03 04
# ./v03/src/my-app/config/upgrade/index.sh 02 03
# -----------------------------------------------------------------------------
# navigate to and run the script while in the following directory
# cd dropbox/swap/fuse

# init all scripts
# chmod a+x ./src/my-app/config/upgrade/index.sh && chmod a+x ./src/my-app/config/upgrade/clone.sh && chmod a+x ./src/my-app/config/upgrade/copy.sh && chmod a+x ./src/my-app/config/upgrade/git.sh && chmod a+x ./src/my-app/config/upgrade/update.sh

# step 0 of 7
# define variables
backup="archive" # name of directory (relative to where script is run from) where we will save backup/archive
timestamp=$(date +%s) # unique name identifier to prevent accidental overwrites
compareto="xfer.txt"
localpath="src/my-app/config/upgrade"
remoterepo="https://github.com/grayox/desert-hawk"
old=$1 # 03
new=$2 # 04

# # step 1 of 7 (deprecated)
# # make backup tar file in case of accidental overwrite or deletion
# # ref: http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-5.html
# # ref: http://www.bic.mni.mcgill.ca/users/kate/Howto/tar_notes.html
# # tar -xf myfile_20030617.tar # extract files
# # mkdir $backup-$timestamp
# tar -cfzv backup-v$old-$timestamp.tgz v$old
# # deprecate: use rsync instead

# # step 1 of 7
# # make backup archive in case of accidental overwrite or deletion
# # ref: https://linux.die.net/man/1/rsync | https://stackoverflow.com/a/14789400/1640892
# mkdir $backup-$timestamp/
# rsync -av --progress v$old $backup-$timestamp/ \
#   --exclude node_modules \
#   --exclude coverage \
#   --exclude build \
#   # -n # test run

# # step 2 of 7
# # copy files and directories to upgraged version
# ./v$old/$localpath/clone.sh $old $new $localpath

# # step 3 of 7
# # compare files for changes
# # compare all files in xfer.txt
# # ref: https://unix.stackexchange.com/a/481182/167174
# # md5 -r xfer.txt
# while IFS= read -r filename;
#   # do diff $old/"$filename-orig" $new/"$filename"; # verbose
#   do [[ $(md5 $old/"$filename-orig") = $(md5 $new/"$filename") ]] || echo $filename differs; # boolean
#   done < v$new/$localpath/$compareto
#   # done < v$old/$localpath/$compareto

# # step 4 of 7
# # copy files and directories to upgraged version
# ./v$old/$localpath/copy.sh $old $new $localpath

# # step 5 of 7
# # make this script executable for next run
# chmod a+x v$new/$localpath/index.sh
# # remember to include (the appropriate version of) the above command in every new file added here to the index.sh

# # step 6 of 7
# # engage git tracking
# ./v$old/$localpath/git.sh $old $new $localpath $remoterepo

# # step 7 of 7
# # update yarn and all dependencies, start server
# ./v$old/$localpath/update.sh $old $new $localpath

#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   

# NOTES
# - add all new files to /src/my-app
# - ~@edit@~ remove (comment out) footer and rightSidePanel from <FuseLayout> in index.js
# - insert new logo in root/public/assets/images/logos/new-brand.svg
# - ~@edit@~ branding in src/main/MainNavbarHeader.js (2 places)

# 1. /src/fuse-configs/fuseNavigationConfig.js -- duplicate(append: `-orig`); rewrite file
# 3. /src/main/content/components/ComponentsConfig.js => /src/my-app/ComponentsConfig.js (now /src/my-app/config/ComponentsConfig.js)
#    - when editing routes in 3 (ComponentsConfig), make sure they match the url in 1 (fuseNavigationConfig).
#    - and that the redirectTo in 2 (fuseRoutesConfig) matches the first (home) route in both 1 (fuseNavigationConfig) and 3 (ComponentsConfig)
# 4. note: home page redirection is via
#    A. /src/fuse-configs/fuseRoutesConfig.js
#    B. /src/main/content/apps/dashboards/analytics/AnalyticsDashboardAppConfig.js
#       note: to avoid collisions, might want to turn off this path/link connection at a later time