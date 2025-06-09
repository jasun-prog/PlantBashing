#!/bin/bash

#variable initialization
growth_rate=1.0
grow_today=false
growth_ready=false
plant_named=false
names=(Morpheus Analiea Izzy)
name_index=0
first_play=true
  days=6
  plant_height=2
  plant_leaves=2
  weather_conditions=(Rainy Sunny Cloudy Overcast Windstorm Rainy Foggy)
  windstorm_count=0

#function for weather conditions
get_weather(){
  #selects a random weather condition from the array
    echo "${weather_conditions[$RANDOM % ${#weather_conditions[@]}]}"

}
#function to make sure leaves dont go into the negative
clamp_leaves(){
  #if plant_leaves is less than 0 then reset it to 0
  if (( $(echo "$plant_leaves < 0" | bc -l) )); then
    plant_leaves=0
  fi
}
#function to make sure growth_rate dont go into the negative
clamp_growth_rate(){
  #if the growth rate is less than 0 then reset it to 0
    if (( $(echo "$growth_rate < 0" | bc -l) )); then
      growth_rate=0
    fi
}
#function to greet user 
greet_user(){
  echo "Hello, I'm Tom. Welcome to ULTRA SIGMA MAKER 2000 V2 PLANTGROWER!!!"
read -p "What is your name? " name
echo "Hello $name. I have entrusted my garden to you."
sleep 2

}
#function for renaming plant if needed
rename_plant_if_needed(){
  #if first play is false and they have named their plant then ask if they want to change their plants name
  if [ "$first_play" = false ] && [ "$plant_named" = true ]; then
  read -p "Do you want to change your plant's name? (yes/no):" rename_choice
  rename_choice="${rename_choice,,}"
  
  #if they say yes then ask if they would like to name their plant
 if [[ "$rename_choice" == "yes" || "$rename_choice" == "y" ]]; then
    read -p "What would you like to name your plant?" plant_name
    plant_named=true

    #if they say no then keep the original name
 elif [[ "$rename_choice" == "no" || "$rename_choice" == "n" ]]; then
    echo "Ok your plants name is $plant_name"
  else 
    echo "Invalid input keeping the current name $plant_name"
  fi
fi
}

prompt_to_plant_seed(){
  #starts the loop
  while true; do
    read -p "Do you want to plant a new seed? (yes/no): " answer
    answer="${answer,,}"
    
    #if the user wants to plant a seed then echo out
    if [[ "$answer" == "yes" || "$answer" == "y" ]]; then
      echo "You dig a hole in soft soil."
      sleep 2
      echo "You plant a seed the size of a marble."
      break
      
      #if they dont then they "walk away" and the game ends
    elif [[ "$answer" == "no" || "$answer" == "n" ]]; then
      echo "You walk away from the garden without planting anything."
      sleep 2
      exit 0
    else
      echo "Invalid input. Please enter yes or no."
    fi
  done
}
  
  
wait_for_growth_days(){
  # Loop from 1 to 2, running the code inside the loop twice
for i in {1..2}; do
  
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
done
}

wait_one_day_prompt(){
      while true; do
    read -p "Would you like to wait one day for you plant to grow (yes/no)"
    answer="${answer,,}"
    #ask the user to wait day
    if [[ "$answer" == "yes" || "$answer" == "y" ]]; then
      echo "You wait one more day"
      sleep 2
      break
    elif [[ "$answer" == "no" || "$answer" == "n" ]]; then
      echo "goodbye"
      exit 0
    else
      echo "invalid input. please type yes or no"
    fi 
  done
  }
 
#functioon to announce that the user's seed has germinated
announce_seed_germination(){
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
  }

name_plant(){
#check it its the players first time playing
  if [ "$first_play" = true ]; then
    
     #ask player if they would like to name their plant
    read -p "Do you want to name your plant? (yes/no) :" name_choice
    name_choice="${name_choice,,}"
    
    #if player says yes they get to name their plant if not their plants name is the default
    if [[ "$name_choice" == "yes" || "$name_choice" == "y" ]]; then
      read -p "What would you like to name your plant? " plant_name
      plant_named=true
      echo "Your plant is now named $plant_name."
    else
      #assign the plant_named variable to the current default name from the names array using name_index
      plant_name=${names[RANDOM % ${#names[@]}]}
      plant_named=true
      echo "OK your plant's name is $plant_name."
    fi
  fi
  } 
  
wait_two_more_days(){
while true; do
    read -p "Would you like to wait one more day or leave now? (wait/leave): " choice
    choice="${choice,,}"
    #if the player chooses "wait"
    if [[ "$choice" == "wait" ]]; then
      echo "You wait patiently..."
      sleep 2
      echo "2 more days have passed. You may now move onto the third stage."
      break
    #if the player chooses "leave"
    elif [[ "$choice" == "leave" ]]; then
      echo "You decide to leave before anything happens."
      sleep 2
      exit 0
    else
      echo "Invalid input. Please type 'wait' or 'leave'."
    fi
  done
}
  
announce_sapling(){
echo "You waited 2 more days..."
  sleep 1
  echo "Day 4 - Nothing happened."
  sleep 1
  echo "Day 5 - Still nothing."
  sleep 1
  echo "Day 6 - OVERNIGHT $plant_name BECAME A SAPLING"
  sleep 1
  plant_height=2
  plant_leaves=2

  echo ""
  echo "$plant_name IS BEGGINING ITS GROWTH JOURNEY"
  sleep 1
  echo "Starting from Day $days — Height: ${plant_height}cm, Leaves: $plant_leaves"
}
apply_weather_conditions(){
  # Start a case statement to handle different weather conditions based on the value of $weather
     case "$weather" in
    "Rainy")
      echo "Its rainy no growth today but $plant_name absords nutrients"
     growth_rate=$(echo "$growth_rate - 2" | bc -l)
     clamp_growth_rate
      growth_today=false
      ;; # End of this case option; continue to next case or exit case block
    "Sunny")
      echo "Its sunny your $plant_name grows alot"
    growth_rate=$(echo "$growth_rate - 2" | bc -l)
    clamp_growth_rate
      growth_today=true
      ;; # End of this case option; continue to next case or exit case block
    "Cloudy")
      echo "its cloudy no growth for $plant_name today"
      growth_today=false
      ;; # End of this case option; continue to next case or exit case block
    "Overcast")
      echo "its overcast some growth happens for $plant_name"
      growth_today=true
      ;; # End of this case option; continue to next case or exit case block
    "Windstorm")
      echo "A windstorm!!! no growth and $plant_name gets damaged"
      growth_rate=$(echo "$growth_rate - 2" | bc -l)
     plant_leaves=$(echo "$plant_leaves - 3" | bc -l)
     clamp_growth_rate
     clamp_leaves
      ((windstorm_count++))
      growth_today=false
      ;; # End of this case option; continue to next case or exit case block
    "Foggy")
      echo "its foggy today no growth for $plant_name"
      growth_rate=$(echo "$growth_rate - 2" | bc -l)
      clamp_growth_rate
      growth_today=false
      ;; # End of this case option; continue to next case or exit case block

      # End of the case statement
    esac


  }

sapling_growth_loop(){
  if [ "$growth_ready" = true ]; then
    echo "$plant_name is ready to grow"
  else
    echo "$plant_name is not ready to grow"
    return
  fi

 #loop continues as long as the plant reaches 35cm in height
while (($(echo "$plant_height < 35" | bc -l))); do

    echo ""
    read -p "Do you want to keep watching $plant_name grow? (yes/no): " answer
    answer="${answer,,}"
    # if the player says "no"
    if [[ "$answer" == "no" || "$answer" == "n" ]]; then
      echo ""
      echo "You leave the garden, your sapling continues to grow on its own. Farewell!"
      exit 0
    #if player chooses "yes" add 1 to days and 2 to plant height and leafs
    elif [[ "$answer" == "yes" || "$answer" == "y" ]]; then
      echo ""
      echo "A day passes..."
      echo "Day $days"
   

      #randomly select a weather condition from the weather array
    weather=${weather_conditions[$RANDOM % ${#weather_conditions[@]}]}
         echo "Weather $weather"
      apply_weather_conditions

      if [ "$growth_today" = true ]; then
       plant_height=$(echo "$plant_height + 1.5" | bc -l)
       plant_leaves=$(echo "$plant_leaves + 2 + (2.5 * $growth_rate)" | bc -l)
       clamp_leaves
       echo "GROWTH TODAY !!! :)"
      echo "Height: ${plant_height}cm"
      echo "Leaves: $plant_leaves"
    else
      echo "No growth today"
      echo "Growth rate: $growth_rate"
       echo "Height: ${plant_height}cm"
      echo "Leaves: $plant_leaves"
     fi

    days=$(echo "$days + 1" | bc)
   else
    echo "invalid input please enter yes or no"
  fi
done
}
 
end_game_summary(){
  echo ""
  echo "$plant_name has fully grown!"
  echo "Total Age: $days days"
  echo "Final Height: ${plant_height} cm"
  echo "Leaf Total: $plant_leaves"
  echo "Thank you for playing the game. You have finished PlantGrower3000"
  echo "$plant_name has survived $windstorm_count WINDSTORMS CONGRAGULATIONS!!!!!!!!!!!!!!!!!!!!"
}

prompt_play_again(){
 while true; do
    read -p "$name, would you like to play the game again? (yes/no): " answer
    answer="${answer,,}"
    #if player wants to player again then
    if [[ "$answer" == "yes" || "$answer" == "y" ]]; then
      echo "Restarting the game..."
      echo "Welcome back $name, lets plant another plant together :)"
      sleep 1
      #changes first play to false meaning that it is no longer the players first time playing
      first_play=false
      break
    #if player does not want to play again then
    elif [[ "$answer" == "no" || "$answer" == "n" ]]; then
      echo "Goodbye! I had a good time with you."
      sleep 2
      exit 0
    else
      echo "Invalid input. Please enter yes or no."
    fi
  done
}

  
  while true; do
  greet_user
  rename_plant_if_needed
  prompt_to_plant_seed
  wait_for_growth_days
  announce_seed_germination
  name_plant
  wait_two_more_days
  announce_sapling
  growth_ready=true
  sapling_growth_loop
  end_game_summary
  prompt_play_again
done
 
