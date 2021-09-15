#!/bin/bash



SRCDIR='/home/oeberle/Bifold/Youtube/Videos/15092021_markl'
FILENAME='AutomatedFeaturEngineerinforAlgorithmicFairness.mp4' 
SCRIPTDIR='/home/oeberle/Bifold/Youtube/Scripts/'


# if video needs to be dowloaded from URL - execute following in SRCDIR shell
# youtube-dl http://www.youtube.com/watch?v=KywIjnH1Z9o

# Remove blank spaces from filename

cd $SRCDIR
rename "s/ //g" *
FILENAME=`ls ${prefix}*.mp4`

echo $FILENAME
cd $SCRIPTDIR

SRC=$SRCDIR/$FILENAME
PROC=$SRCDIR/video.mp4

echo $SRC
echo $PROC

avconv -i $SRC -s 1280x720 -strict -2 $PROC
TARGET=$SRCDIR/bifold_final.mp4
python join_videos.py --src $PROC --target $TARGET



