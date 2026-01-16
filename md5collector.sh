TARGET_DIR="/etc"
TARGET=$(find $TARGET_DIR -type f)

for f in $TARGET; do
	md5sum $f >> FileChkSum
done

