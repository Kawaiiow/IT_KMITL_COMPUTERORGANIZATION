echo "Looking for file in this directory $(pwd)"
echo "number of files in $(pwd) : $(find . -maxdepth 1 -type f | wc -l)"
echo "Looking for all file in $(pwd) and its subdirectory"
echo "number of files in $(pwd) and its sub directories : $(find . -not -path "*/[@.]*" -type f | wc -l)"

