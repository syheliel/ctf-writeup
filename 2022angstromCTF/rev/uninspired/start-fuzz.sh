#!/bin/bash -
#===============================================================================
#
#          FILE: start-fuzz.sh
#
#         USAGE: ./start-fuzz.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 04/30/22 20:27:49
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error
rm ./fuzz-out/ -rf
IN="./fuzz-in"
OUT="./fuzz-out"
TAR=$(which ./uninspired_patch)
ENV=""
# main loop
tmux new-window -d "$ENV afl-fuzz -i $IN -o $OUT -Q -M master -- $TAR;exec bash"

echo "start master"
# slave
for i in {1..8};
do
  name="fuzz-slave-$i"
  tmux new-window "$ENV afl-fuzz -i $IN -o $OUT -Q -S $name -- $TAR"
  echo "stat $name"
done
# AFL_SKIP_CPUFREQ=1 afl-fuzz -i ./fuzz-in -o ./fuzz-out-patch -Q -- $(which ./uninspired_patch)

