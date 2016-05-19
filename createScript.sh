#!/bin/sh


while read line
do
  TMP=`java Parser 5 $line`
  echo $TMP 
done < tools.txt