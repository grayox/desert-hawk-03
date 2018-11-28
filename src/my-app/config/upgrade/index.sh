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
# -----------------------------------------------------------------------------
# navigate to and run the script while in the following directory
# cd dropbox/swap/fuse

# init all scripts
# chmod a+x ./src/my-app/config/upgrade/index.sh && chmod a+x ./src/my-app/config/upgrade/clone.sh && chmod a+x ./src/my-app/config/upgrade/copy.sh && chmod a+x ./src/my-app/config/upgrade/git.sh && chmod a+x ./src/my-app/config/upgrade/update.sh

# step 0 of 6
# define variables
BACKUP=""
TIMESTAMP=
PATH="src/my-app/config/upgrade"
REPO="https://github.com/grayox/desert-hawk"
OLD=$1
NEW=$2

# step 1 of 6
# make backup tar file in case of accidental overwrite or deletion
# ref: http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-5.html
# ref: http://www.bic.mni.mcgill.ca/users/kate/Howto/tar_notes.html
OF=$BACKUP-$(date +%Y%m%d).tgz
tar -cZf $OF /home/me/
# tar -xf myfile_20030617.tar # extract files

# step 2 of 6
# copy files and directories to upgraged version
./v$OLD/$PATH/clone.sh $OLD $NEW $PATH

# step 3 of 6
# copy files and directories to upgraged version
./v$OLD/$PATH/copy.sh $OLD $NEW $PATH

# step 4 of 6
# make this script executable for next run
chmod a+x v$NEW/$PATH/index.sh
# remember to include (the appropriate version of) the above command in every new file added here to the index.sh

# step 5 of 6
# engage git tracking
./v$OLD/$PATH/git.sh $OLD $NEW $PATH $REPO

# step 6 of 6
# update yarn and all dependencies, start server
./v$OLD/$PATH/update.sh $OLD $NEW $PATH

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