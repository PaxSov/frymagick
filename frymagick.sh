#!/bin/bash
NUM=0
IMG=30
QAL=75
REZ=600
FINREZ=1920
OUT=69
read -p "What is the name of the image?" IMG
read -p "What should be the name of the final output be?" OUT
read -p "How many times should this be jpegged? Type n if you do not want this" NUM
case $NUM in
	[Nn]* ) NUM=0
esac
read -p "What should the quality be? (higher = better)" QAL
read -p "What resolution should the first product be?" REZ
read -p "What should the resolution of the final product be?" FINREZ
if [ "$NUM" -ne 0 ]
then
 for i in $(seq 1 $NUM); do
	convert $IMG -resize $REZ -quality $QAL $OUT
	convert $OUT -resize $FINREZ -quality 100 $OUT
done
elif [ "$REZ" = "$FINREZ" ]
then
	for i in $(seq 1 $NUM); do
		convert $IMG -resize $REZ -quality $QAL $OUT
done
fi
