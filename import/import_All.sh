#!/bin/bash

filelist=$HOME/alkis_hh/filelists/nas_hh.lst

echo "PG:dbname=alkis_hh user=postgres password=postgres" >$filelist
echo "create" >>$filelist
echo "temp /bigdata/tmp/alkis" >>$filelist
#echo "options --config PG_USE_COPY NO" >>$filelist
echo "jobs 6" >>$filelist
echo "log $HOME/alkis_hh/filelists/logs/hh.log" >>$filelist

cd /bigdata/alkis_hh/

for j in *.xml.gz; do
	path="$PWD"
	echo ${path}"/"$j >>$filelist
done

echo "postprocess" >>$filelist
