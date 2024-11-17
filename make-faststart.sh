#!/bin/bash
if [[ ! -f "$1.mp4" ]]
then
echo "Usage: $0 <Name> [title]"
echo "<Name> must not include .mp4 at the end"
exit 1
fi
cat <<EOF > play-$1.html
<!DOCTYPE html>
<html>
<head>
<title>$2</title>
</head>
<body>
<video id="media" poster="preview.$1.jpg" controls>
<source src="$1.faststart.mp4" video="video/mp4">
</video>
</body>
</html>
EOF
ffmpeg -i $1.mp4 -ss 00:01:00 -frames:v 1 preview.$1.jpg
ffmpeg -i $1.mp4 -movflags faststart $1.faststart.mp4
