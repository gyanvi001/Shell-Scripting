#!/bin/bash

if ( $# -ne 1 ); then
    echo "Usage: $0 <var/dir>"
    exit 1
fi

dir=$1

if [ ! -d $dir ]; then
    echo "Error: $dir is not a directory"
    exit 1
fi

find  $dir -type f -empty -exec rm -f {} \;
echo "Empty files deleted"

