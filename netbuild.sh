#!/usr/bin/env bash
## Netbuild
## created 2020.4.17
## author Tobias Fried <friedtm@gmail.com>

##
##

INPUT="$1"
OUTPUT="$2"
SYNSET_EXPRESSION='s/^.*) \(.*\) --.*$/\1/g; s/,//gp'
DEFINITION_EXPRESSION='s/^.*-- (\(.*\))$/\1/g; s/\(\x27\W\|\W\x27\|^\x27\|\x27$\)/ /g; s/[\.\$\!\^`,:"]//g'

function usage {
  echo "Usage: $(basename "$0") INPUT [OUTFILE]" 1>&2;
  exit 1;
}

function query {
  WORD="$1"
  if [[ -n $OUTPUT ]]; then
    echo "$WORD" >> "$OUTPUT";
    wn "$WORD" -over | grep ".\." | sed -e "$DEFINITION_EXPRESSION" >> "$OUTPUT";
    echo -e "" >> "$OUTPUT";
  else
    echo "$WORD";
    wn "$WORD" -over | grep ".\." | sed -e "$DEFINITION_EXPRESSION";
    echo -e "";
  fi
}
 
if [[ -z $1 ]]; then
  usage
fi

# if INPUT is a string, iterate its words 
if [[ ! -f "$INPUT" ]]; then
  for WORD in $INPUT; do
    query "$WORD"
  done

# if INPUT is a file, iterate its lines
else
  [[ -n "$OUTPUT" ]] && > "$OUTPUT" # clear OUTFILE, if it exists
  while read WORD; do
    query "$WORD"
  done < "$INPUT"

fi
