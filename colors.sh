# Show available terminal colours.
# Heavily modified version of the TLDP script here:
# http://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html

print_colors(){
  # Print column headers.
  printf "%-4s  " '' ${bgs[@]}
  echo
  # Print rows.
  for bold in ${bolds[@]}; do
    for fg in ${fgs[@]}; do
      # Print row header
      printf "%s;%s  " $bold $fg
      # Print cells.
      for bg in ${bgs[@]}; do
        # Print cell.
        printf "\e[%s;%s;%sm%s\e[0m  " $bold $fg $bg "text"
      done
      echo
    done
  done
}

# Print standard colors.
bolds=( 0 1 )
fgs=( 3{0..7} )
bgs=( 4{0..8} )
print_colors

# Print vivid colors.
bolds=( 0 ) # Bold vivid is the same as bold normal.
fgs=( 9{0..7} )
bgs=( 10{0..8} )
print_colors
