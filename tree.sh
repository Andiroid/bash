#!/usr/bin/env bash

#get user input -> tree ratio
if [ $# == "0" ] || (( $1 < 2 )); then
	TREE_SIZE=
	while [ -z "$TREE_SIZE" ] || (( TREE_SIZE < 2 )); do
		read -p " 1 >> Baumgröße >> ∞ : " TREE_SIZE
	done; set -- $TREE_SIZE
fi

# ∞ equals max int64 9223372036854775807

# double blanks after l

#init tree
l="\e[48;5;82m\e[38;5;82m#\e[0m"
printf "%*.0i$l\n" $(($1+1))
for((i=0;i<$1-1;++i)) do
	printf "%*.0i" $(($1-i))
	for((y=0;y<=i;++y)) do printf "$l$l" ; done
	[[ "$i" == $(($1-2)) ]] && printf "$l" || printf "$l\n"
done

#trunk ratio algorithm
tr=$((($1*2-$1/2)/3))
if((tr%2 == 0)); then tr=$((tr-1)); fi
sp=$((($1*2-1-tr)/2+2))

#init trunk
for((x=0;x<tr-tr/2;++x))do
	printf "%*.0i\n%*.0i" $((sp)) 0 $((sp))
	for((b=0;b<tr;++b))do printf "\e[48;5;94m\e[38;5;94m|\e[0m"; done
done

printf "\n"
exit 0
