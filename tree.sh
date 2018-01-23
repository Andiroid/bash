#produce tree
printf "%*.0i#\n %*.0i###\n" $(($1)) 0 $(($1-2))
for((i=0;i<$1-2;++i)) do
	printf "%*.0i" $(($1-i-2))
	for((y=0;y<=i+1;++y)) do printf "%s" "##"; done
	[[ "$i" == $(($1-3)) ]] && printf "#" || printf "#\n"
done

#stomp ratio algorithm
[[ $((($1*2-1)/3%3>2)) ]] && st=$((($1*2-1)/3-1)) || st=$((($1*2-1)/3+1))
if((st%2 == 0)); then st=$((st+1)); fi
sp=$((($1*2-1-st)/2))

#produce stomp
for((x=0;x<st-st/3;++x))do
	printf "%*.0i\n%*.0i" $((sp+1)) 0 $((sp+1))
	for((b=0;b<st;++b))do printf "*"; done
done

printf "\n"