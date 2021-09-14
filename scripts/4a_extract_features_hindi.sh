#!/bin/sh

# Download the hindi audio files 
# into a directory called 'hindi-audio'
# and English audio files into a directory called 'english-audio'
# inside the 'data' directory of this repository before running this script
# This script will be run after extracting inddvidual chunks of
#audio using the PRAAT script


#For Hindi files
cd ../data/hindi-audio;

#cd $root_fol;
for direcs in */
do
  cd $direcs;
  echo 'Directory '$direcs;
  i=0;
  for files in *
  do
    i=$((i+1));
    #echo ${files%.*};
    
    #For Hindi files
    #Extract the OpenSMILE library inside the same directory
    #as this script. Also change the directory name in the
    #following line as it is in your case
    SMILExtract -C openSMILE-2.2rc1/config/gemaps/eGeMAPSv01a.conf -I ../data/hindi-audio/$direcs/$files -N ${files%.*}
    
    #echo $files;
  done;
  echo $i' files read and processed';
  cd ..;	
done;
