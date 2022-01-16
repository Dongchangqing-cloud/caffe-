#!/bin/sh
#function:create the label files for create_lmdb files
#author:dongchangqing
#edition:v1.0
#history:2020/02/05,build;
#2020/02/10,change for new image sets


IMG=/home/moyan/huyin/caffe-master/dcq-models/srcimg/542/
FILENAME=train6-38789
OUTNAME=6train.txt

echo ${FILENAME}

cd $IMG
rm -rf $OUTNAME

echo "train file begin transform..."
for file in $(ls $IMG/$FILENAME)
do
    echo "$file is process..."
    if [ -d $IMG/$FILENAME/$file ]; then
	for imgname in $(ls $IMG/$FILENAME/$file | tr " " "\?")
	do
#	    echo $imgname
#	    echo "    "
	    label1=${FILENAME}
	    labelname="$label1/$file/$imgname $file" 
	    echo $labelname >> $IMG/$OUTNAME
	done
    fi
#    echo "next:"
done
echo "train files transform done!"


