for fg in {30..37} 39; 
  do 
    for bg in {40..47} 49; 
      do 
        printf "\e[${fg};${bg}m~TEST~"; 
done; 
printf "\n"; 
done;
