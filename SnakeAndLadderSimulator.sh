#!/bin/bash -x

#DISPLAYING WELCOME MESSAGE
echo Welcome To Snake And Ladder Simulation Problem

#CONSTANTS
NUMBER_OF_PLAYER=1;
STARTING_POSITION=0;

#VARIABLE
resultNumber=0;

#FUNCTION TO GENERATE ROLL DICE NUMBER
function rollDice() {
	resultNumber=$(( $(($RANDOM%6))+1 ))
	echo $resultNumber
}

#CALLING FUNCTION TO GET NUMBER
rollDice
