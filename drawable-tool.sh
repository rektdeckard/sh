#!/bin/bash
## Drawable Tool
## created 2019.6.15
## updated 2019.7.20
## author Tobias Fried <friedtm@gmail.com>

## A bash script for Android Icon Pack creators
## Create a list of drawable resources (PNGs) in the specified directory, in the format required for your drawable.xml

DRAWABLE="drawable.xml"
DESTINATION="./$DRAWABLE"
VERBOSE=1
TEST=0

# Set flags for verbose/silent and test/execute

while getopts ":hqstvx" OPT; do
  case ${OPT} in
    q|s )
      VERBOSE=0
      ;;
    t )
      TEST=1
      ;;
    v )
      VERBOSE=1
      ;;
    x )
      TEST=0
      ;;
    \? )
      echo "Invalid option -$OPTARG" 1>&2
      echo ""
      ;&
    h )
      echo "USAGE: drawable-tool [OPTIONS] [TARGET] [DESTINATION]"
      echo ""
      echo "OPTIONS:"
      echo "    -h          display this help doc"
      echo "    -q, -s      silent"
      echo "    -v          verbose mode is set by default"
      echo "    -t          test mode sends changes to Standard Output but does not write to $DRAWABLE"
      echo "    -x          execute mode is set by default"
      echo ""
      echo "TARGET:"
      echo "                optional directory containing PNGs, if omitted is run in working directory"
      echo ""
      echo "DESTINATION:"
      echo "                optional destination to write $DRAWABLE, if omitted is written to working directory"
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

# Test for valid directories

pushd . > /dev/null

if [ -n "$1" ]; then
  if [ -d "$1" ]; then
    cd "$1"
  else
    echo "That directory does not exist."
    popd > /dev/null
    exit 1
  fi
fi

if [ -n "$2" ]; then
  if [ -d "$2" ]; then
    DESTINATION="$(dirname $2)/$(basename $2)/$DRAWABLE"
  else
    echo "Invalid destination $2"
    popd > /dev/null
    exit 1
  fi
fi

# Test if contains PNGs

if ls | grep -i .png > /dev/null; then

  # Write required enclosing XML tags

  echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<resources>

  <category title=\"All\" />" > "$DESTINATION"

  # Add entry for each PNG in the directory
 
  shopt -s nocaseglob

  for FILE in *.png; do
    if [ "$VERBOSE" == 1 ]; then
      echo "Processing ${FILE}"
    fi
    if [ "$TEST" == 0 ]; then
      echo "    <item drawable=\"${FILE%.*}\" />" >> "$DESTINATION"
    fi
  done

  shopt -u nocaseglob

  echo "
</resources>" >> "$DESTINATION"
  if [ "$VERBOSE" == 1 ]; then
    echo "Done"
  fi
    
else
  echo "No PNG files found."
fi

popd > /dev/null
