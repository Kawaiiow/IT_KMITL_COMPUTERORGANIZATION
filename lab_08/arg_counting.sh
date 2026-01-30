if [ $# -ne 2 ]; then
	echo "Please Enter X and Y properly"
	exit 1
fi

X=$1
Y=$2

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

