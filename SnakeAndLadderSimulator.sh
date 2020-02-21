#!/bin/bash -x

#DISPLAYING WELCOME MESSAGE
echo Welcome To Snake And Ladder Simulation Problem

#CONSTANTS
NUMBER_OF_PLAYER=1;
STARTING_POSITION=0;
SNAKE=0;
LADDER=1;
NO_PLAY=2;

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
	echo $playerPosition
}

#FUNCTION TO GENERATE ROLL DICE NUMBER
function rollDice() {
	resultNumber=$(( $(($RANDOM%6))+1 ))
	echo $resultNumber
	snakeLadderHold
}

#CALLING FUNCTION TO GET NUMBER
rollDice
