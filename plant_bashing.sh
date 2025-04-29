#!/bin/bash
echo "Hello children this is the best plant game you'll ever see"
#ask user for their name
echo "What is your name?"
read name
#greet user
echo "Hello, $name"
echo "Hello $name You're one of the best people I could have asked for this task."
sleep 20
echo "Goodbye I'll miss You, Goodbye :("
read -p "Do you want to plant a new seed? (yes/no)" answer
answer="${answer,,}" 
#check for valid yes or no
if [[ "$answer" == "yes" || "$answer" =="y"]]; then
echo "You dig a hole in soft soil"
sleep 2
echo "You plant a seed the size of a marble"
break #exit loop to continue game
elif [["$answer" =="no" || "$answer" == "no"]]; then
echo "You walk away from the garden without planting anyting"
sleep 2
exit 0
fi

#if input is invalid prompt user again
echo "Invalid input. Please enter yes or no"
done
echo "In this digital world "