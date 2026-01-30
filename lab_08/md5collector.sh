TARGET_DIR="/etc"
TARGET=$(find $TARGET_DIR -not -path "*/[@.]*")

for f in $TARGET; do
	sudo md5sum $f
done

