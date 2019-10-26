#!/bin/bash
# Date Toucher
# created 2019.04.19
# author Tobias Fried <friedtm@gmail.com>

# Sets file modification date based on date found in filename.
# Files should be formatted as follows:
# *[YYYY].[MM].[DD].tar.xz

for file in *.tar.xz; do
  [ -f "$file" ] || continue
  if [[ $file =~ ^.*-([[:digit:]]+).([[:digit:]]+).([[:digit:]]+)-([[:digit:]]+).([[:digit:]]+).tar.xz$ ]]; then
      datestr="${BASH_REMATCH[1]}${BASH_REMATCH[2]}${BASH_REMATCH[3]}${BASH_REMATCH[4]}${BASH_REMATCH[5]}"
      touch -m -t "$datestr" $file
      echo "$file -> date set as $datestr"
    fi
done

