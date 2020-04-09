#!/bin/bash


declare -A playerPosition
playerPosition[1]=0
playerPosition[2]=0
noOfRoll=0
playerFlag=1
snake=1
ladder=0
samePosition=2
startPosition=0
endPosition=100

playFunc () {
	local playerChance=$1
	local position=${playerPosition[$playerChance]}
	local diceRoll=$((RANDOM%6+1))
	noOfRoll=$((noOfRoll+1))
	randomOption=$((RANDOM%3))
	case $randomOption in
		$ladder)
			if [[ "$((position+diceRoll))" -le $endPosition ]] 
			then
				position=$((position+diceRoll))
				playerPosition[$playerChance]=$position
				echo "Player" $playerChance ":"$position
			fi
			;;
		$Snake)
			if [[ "$((position-diceRoll))" -ge $startPosition ]]
			then
		 		position=$((position-diceRoll))
				playerPosition[$playerChance]=$position
				echo "Player" $playerChance ":"$position
			fi
		;;
		$samePosition)
			echo "Player" $playerChance ":"$position
		;;
		"*")
			echo invalid
		;;
	esac
	if [ $diceRoll -eq 6 ]
	then
		playFunc $playerChance
	fi
}

checkWin () {
  	while [ ${playerPosition[$playerFlag]} -ne $endPosition ]
	do
      		playFunc $playerFlag
      		if [ $playerFlag -eq 2 ]
          	then
              		playerFlag=1
          	else
            		playerFlag=2
          	fi
  	done
}
echo "Welcome to snake and Ladder program"

checkWin
echo Total No of dice Roll : $noOfRoll
