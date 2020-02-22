#!/bin/bash -x

#DISPLAYING WELCOME MESSAGE
echo Welcome To Snake And Ladder Simulation Problem

#CONSTANTS
STARTING_POSITION=0;
SNAKE=0;
LADDER=1;
NO_PLAY=2;
WINNING_POSITION=100;

#VARIABLES
flag=0;
playerOnePosition=0;
playerTwoPosition=0;

#FUNCTION TO GENERATE ROLL DICE NUMBER
function rollDice() {
	echo "$(( $(($RANDOM%6))+1 ))"
}

#FUNCTION TO GENERATE THE OPTION AND GIVE PLAYER POSITION ACCORDINGLY
function snakeLadderHold() {
	local playerPosition=$1
	local resultNumber=0;
	resultNumber=$(rollDice)
	case $((RANDOM%3)) in
		$SNAKE)
			playerPosition=$(($playerPosition-$resultNumber))
			if [[ $playerPosition -lt $STARTING_POSITION ]]
			then
				playerPosition=$STARTING_POSITION
			fi
				;;
		$LADDER)
			playerPosition=$(($playerPosition+$resultNumber))
			if [[ $playerPosition -gt $WINNING_POSITION ]]
			then
				playerPosition=$(($playerPosition-$resultNumber))
			fi
				;;
		$NO_PLAY)
			playerPosition=$playerPosition
				;;
	esac
	echo $playerPosition
}

#CHECKING WINNING CODITION AND UPDATING PLAYERS POSITION
 while [[ $playerOnePosition -ne $WINNING_POSITION && $playerTwoPosition -ne $WINNING_POSITION ]]
 do
	if [[ flag -eq 0 ]]
	then
		playerOnePosition=$( snakeLadderHold $playerOnePosition )
		flag=1;
		if [[ $playerOnePosition -eq $WINNING_POSITION ]]
		then
			echo "CONGRATULATIONS ! PLAYER ONE WON"
		fi
	else
		playerTwoPosition=$( snakeLadderHold $playerTwoPosition )
		flag=0;
		if [[ $playerTwoPosition -eq $WINNING_POSITION ]]
		then
			echo "CONGRATULATIONS ! PLAYER TWO WON"
		fi
	fi
done
