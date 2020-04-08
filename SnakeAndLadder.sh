#!/bin/bash


playerPosition[1]=0
diceRoll=$((RANDOM%6+1))
randomOption=$((RANDOM%2))
echo welcome to Snake And Ladder program

if [ $randomOption -eq 0 ]
then
	echo "Ladder, moving player ahead by" $dieRoll "Position"
elif [ $randomOption -eq 1 ]
then
	echo "Snake, movin player behind by "$dieRoll" Position"
else
 	echo "you Stay there"
fi
