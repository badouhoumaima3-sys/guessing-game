
#!/bin/bash

# Function to count files in the current directory
function count_files {
    find . -maxdepth 1 -type f | wc -l
}

# Function to check the user's guess
function check_guess {
    if [ "$1" -lt "$2" ]; then
        echo "Your guess is too low!"
    elif [ "$1" -gt "$2" ]; then
        echo "Your guess is too high!"
    else
        echo "Congratulations! You guessed correctly!"
        return 0
    fi
    return 1
}

# Main program
echo "Welcome to the Guessing Game!"
echo "How many files are in the current directory?"

# Count the files
number_of_files=$(count_files)

# Initialize the guess
guess=-1

# Continue until the correct answer
while [ "$guess" -ne "$number_of_files" ]; do
    read -p "Enter your guess: " guess

    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid positive number."
        guess=-1
    else
        check_guess "$guess" "$number_of_files"
    fi
done
