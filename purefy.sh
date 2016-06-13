#!/bin/sh                                                                                                                                

# remove noise from AUDIO files
input_file="$@"
PATH="$PATH:/usr/bin:/usr/sbin"

SOX=/usr/bin/sox

remove_noise() {
	echo "[make spectrogram for $input_file]"
	$SOX $input_file -n spectrogram	-o $input_file.png
	echo "[get noise sample from $input_file]"
	# sometimes you need to change trim distance
	#$SOX $input_file noise.wav trim 0 00:01
	$SOX $input_file noise.wav trim 1 1.2
	echo "[generate noise profile]"
	$SOX noise.wav -n noiseprof $input_file.profile
	echo "[cleanup $input_file]"
	$SOX $input_file "$input_file"_cleaned.wav noisered $input_file.profile 0.21
	echo "[make spectrogram for cleaned audio]"
	$SOX "$input_file"_cleaned.wav -n spectrogram -o "$input_file"_cleaned.png
	echo '[cleaned file placed in '$input_file'_cleaned.wav]'
	echo "[cleanup all other noise]"
	$SOX "$input_file"_cleaned.wav -r 8000 -c2 /tmp/output.wav  lowpass 4000 rate
	echo "[wav to mp3 convertation, need installed lame codec]"
	ffmpeg -i /tmp/output.wav -vn -ar 44100 -ac 2 -ab 192 -f mp3 "$input_file"_cleaned.mp3
	rm -f /tmp/output.wav
}

if [ $# -lt 1 ]; then
  echo "Usage: $0 input_file"
  exit 1
fi

remove_noise
