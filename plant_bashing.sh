#!/bin/bash
echo "Hello, I'm Tom. Welcome to PlantGrower 3000!!!"

echo "What is your name?"
read name

echo "Hello $name. I have entrusted my garden to you."
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

echo "You waited 3 days for the seed to grow"
sleep 2
echo "YOUR SEED HAS GERMINATED OVERNIGHT!!!"
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

days=5
plant_height=2
plant_leaves=2

echo ""
echo "Your sapling begins its growth journey..."
sleep 2
echo "Starting from Day $days — Height: ${plant_height}cm, Leaves: $plant_leaves"

while [ "$days" -lt 21 ]; do
  echo ""
  read -p "Do you want to keep watching your sapling grow? (yes/no): " answer
  answer="${answer,,}"

  if [[ "$answer" == "no" || "$answer" == "n" ]]; then
    echo ""
    echo "You gently leave the garden. Your sapling continues to grow on its own. Farewell!"
    exit 0
  elif [[ "$answer" == "yes" || "$answer" == "y" ]]; then
    days=$((days + 1))
    plant_height=$((plant_height + 2))
    plant_leaves=$((plant_leaves + 2))

    echo ""
    echo "A day passes..."
    echo "Day $days"
    echo "Height: ${plant_height}cm"
    echo "Leaves: $plant_leaves"
    sleep 2
  else
    echo "Invalid input. Please enter yes or no."
  fi
done

echo ""
echo "Your sapling has fully matured!"
echo "Total Age: 21 days"
echo "Final Height: 34 cm"
echo "Leaf Total: 34"
echo "thank you for playing the game. You have finished PlantGrower3000"
exit 0