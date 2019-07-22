#!/bin/bash
echo -e "The name of this script is: \033[1m$0\033[0m."
echo -e "The first argument passed from the command line is: \033[4m$1\033[0m."
echo -e "The second argument is: \033[4m$2\033[0m."
echo -e "All of the arguments are: \033[4m$*\033[0m."
echo -e "All done with \033[1m$0\033[0m. Executed with \033[1m$#\033[0m arguments passed."
