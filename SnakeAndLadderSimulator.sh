#!/bin/bash -x

#DISPLAYING WELCOME MESSAGE
echo Welcome To Snake And Ladder Simulation Problem

#CONSTANTS
NUMBER_OF_PLAYER=1;
STARTING_POSITION=0;
SNAKE=0;
LADDER=1;
NO_PLAY=2;
WINNING_POSITION=100;

#VARIABLES
resultNumber=0;
playerPosition=0;
option=0;

#FUNCTION TO GENERATE THE OPTION AND GIVE POSITION ACCORDINGLY
function snakeLadderHold() {
	case $((RANDOM%3)) in
		$SNAKE)
			playerPosition=$(($playerPosition-$resultNumber))
					;;
		$LADDER)
			playerPosition=$(($playerPosition+$resultNumber))
					;;
		$NO_PLAY)
			playerPosition=$playerPosition
					;;
	esac
	echo Players Current Position = $playerPosition
}

#FUNCTION TO GENERATE ROLL DICE NUMBER
function rollDice() {
	resultNumber=$(( $(($RANDOM%6))+1 ))
	echo Dice Roll Result = $resultNumber
	snakeLadderHold
}

#CALLING FUNCTION TO GET NUMBER TILL REACHES EXACT WINNING POSITION AND IF REACHES BELOW ZERO THEN AGAIN RESUMING FROM STARTING POSITION
while [[ $playerPosition -ne $WINNING_POSITION ]]
do
	if [[ $playerPosition -lt $STARTING_POSITION ]]
	then
		playerPosition=$STARTING_POSITION
	elif [[ $playerPosition -gt $WINNING_POSITION ]]
	then
		playerPosition=$(($playerPosition-$resultNumber))
	fi
	rollDice
done
