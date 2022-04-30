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
afl-fuzz -i ./fuzz-in -o ./fuzz-out -Q -- ./uninspired @@
