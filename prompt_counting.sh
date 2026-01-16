read -p "Enter X value: " X
read -p "Enter Y value: " Y


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

