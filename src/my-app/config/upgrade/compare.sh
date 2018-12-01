#!/bin/bash
#
# compare files for changes
# compare all files in xfer.txt

#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   

# define variables
old=$1
new=$2
localpath=$3
# remoterepo=$4
compareto=$4

# ref: https://unix.stackexchange.com/a/481182/167174
# md5 -r v03/README-orig.md
# md5 -c <file1> <file2>
# md5 v03/src/@fuse/components/FuseAuthorization/FuseAuthorization-orig.js \
# md5 v04/src/@fuse/components/FuseAuthorization/FuseAuthorization.js
# while IFS= read -r filename;
#   # do diff $old/"$filename-orig" $new/"$filename"; # verbose
#   do [[ $(md5 v$old/"$filename-orig") = $(md5 v$new/"$filename") ]] || echo $filename differs; # boolean
#   done < v$old/$localpath/$compareto
# ref: https://stackoverflow.com/a/965072/1640892
while IFS= read -r fullfile; # path/to/foo.bar
  do
    filename="${fullfile##*/}" # foo.bar
    pathto="${fullfile%/*}" # path/to
    prefix="${filename%.*}"; # foo
    extension="${filename##*.}" # bar
    # echo fullfile: $fullfile;
    # echo pathto: $pathto;
    # echo filename: $filename;
    # echo prefix: $prefix;
    # echo extension: $extension;
    md5 "v$old/$pathto/$prefix-orig.$extension"
    md5 "v$new/$fullfile"
    [[ $(md5 -q "v$old/$pathto/$prefix-orig.$extension") == $(md5 -q "v$new/$fullfile") ]] || echo differs: $fullfile; # boolean
  done < v$old/$localpath/$compareto

#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   

# make this script executable for next run
chmod a+x "v$old/$localpath/compare.sh"