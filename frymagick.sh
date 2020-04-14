#!/bin/bash
NUM=10
IMG=30
QAL=75
REZ=600
FINREZ=1920
OUT=69
read -p "What is the name of the image?" IMG
read -p "What should be the name of the final output be?" OUT
read -p "How many times should this be jpegged?" NUM
read -p "What should the quality be? (higher = better)" QAL
read -p "What resolution should the first product be?" REZ
read -p "What should the resolution of the final product be?" FINREZ
for i in $(seq 1 $NUM); do
	convert $IMG -resize $REZ -quality $QAL $OUT
	convert $OUT -resize $FINREZ -quality 100 $OUT
done
