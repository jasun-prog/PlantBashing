#!/bin/bash

echo "Hello children, this is the best plant game you'll ever see!"

echo "What is your name?"
read name

echo "Hello $name. You're one of the best people I could have asked for this task."
sleep 2
echo "Goodbye. I'll miss you. Goodbye :("

while true; do
  read -p "Do you want to plant a new seed? (yes/no): " answer
  answer="${answer,,}" # Convert to lowercase

  if [[ "$answer" == "yes" || "$answer" == "y" ]]; then
    echo "You dig a hole in soft soil."
    sleep 2
    echo "You plant a seed the size of a marble."
    break
  elif [[ "$answer" == "no" || "$answer" == "n" ]]; then
    echo "You walk away from the garden without planting anything."
    sleep 2
    exit 0
  else
    echo "Invalid input. Please enter yes or no."
  fi
done

echo "In this world, time moves faster than in the real world. Mere minutes or seconds in this world are equivalent to hours, days, or months."

while true; do
  read -p "Would you like to wait for your seed to grow? (yes/no): " answer
  answer="${answer,,}"

  if [[ "$answer" == "yes" || "$answer" == "y" ]]; then
    echo "You wait one day..."
    sleep 2
    break
  elif [[ "$answer" == "no" || "$answer" == "n" ]]; then
    echo "Goodbye ... :("
    sleep 2
    exit 0
  else
    echo "Invalid input. Please enter yes or no."
  fi
done

echo "You wait 3 days for the seed to grow..."
sleep 2
echo "Your seed has germinated overnight!"
echo "Total current days:"
sleep 1
echo "Day 1 - Planted the seed."
sleep 1
echo "Day 2 - Nothing happened."
sleep 1
echo "Day 3 - The seed has germinated overnight."

while true; do
  read -p "Would you like to wait one more day or leave now? (wait/leave): " choice
  choice="${choice,,}"

  if [[ "$choice" == "wait" ]]; then
    echo "You wait patiently..."
    sleep 2
    echo "2 more days have passed. You may now move onto the third stage."
    break
  elif [[ "$choice" == "leave" ]]; then
    echo "You decide to leave before anything happens."
    sleep 2
    exit 0
  else
    echo "Invalid input. Please type 'wait' or 'leave'."
  fi
done

echo "You waited 2 more days..."
sleep 1
echo "Day 4 - Nothing happened."
sleep 1
echo "Day 5 - Still nothing."
sleep 1
echo "Day 6 - Overnight, the plant grew into a SAPLING!"
