if [[ -z "${X}" || -z "${Y}" ]]; then
	echo "Please declare X and Y in env by using"
	echo "export X=[number] Y=[NUMBER]"
	exit 1
fi

if [ $X -gt $Y ]; then
	while [ $X -ge $Y ]; do
		echo "$X"
		((X--))
	done
else
	while [ $X -le $Y ]; do
		echo "$X"
		((X++))
	done
fi

