#!/bin/sh

# Put this script in the same folder as the video files
# in mp4 format.
# It extracts the sound track from thsose files and
# saves in the WAV format.

for f in *.mp4
do
	only_name=${f%.*};
	echo ${only_name##*/}_1.wav;
	avconv -y -i $f -vn -ar 44100 -b:a 16k  -ac 2 ${only_name##*/}_1.wav;
	wait;
	sox ${only_name##*/}_1.wav -c 1 -b 16 -e signed-integer ${only_name##*/}.wav;
	wait;
	rm ${only_name##*/}_1.wav;
	rename 's/VIDEO/AUDIO/' *.wav;
done
