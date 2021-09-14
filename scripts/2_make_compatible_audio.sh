#!/bin/sh


# Depending on the language that you are working with
# comment one of the following and uncomment the other

# If OpenSMILE is generating an error with your WAV file
# then it converts that audio in a format compatible with the 
# library

cd ../data/hindi-audio;
#cd ../data/english-audio;

#cd $root_fol;
for direcs in */ ;
do
  cd $direcs;
  echo 'Directory '$direcs;
  i=0;
  for files in * ;
  do
    i=$((i+1));
    sox $files -c 1 -b 16 -e signed-integer compat_audio/$files;
    #echo $files;
  done;
  echo $i' files read and processed';
  cd ..;
done;