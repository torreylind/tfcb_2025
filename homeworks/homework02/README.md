# Homework 2: Unix shell

This homework will assess your ability to run commands in the shell and make a simple script.

Replace the lines specified in _italics_ with your answers and save as a text file.


## Problem 0

**60 points**

Complete the interactive tutorial.

Overall, some sections are dense and don't explain the rational/logic behind **why** we are performing these commands. Wish there was a more applicable example to something we might encounter while doing biology. It jumps between experimenting and reading documentation without an explicit goal. Could provide mini-checkpoints, e.g., “Count the number of lines in sequence.gb using wc and record your answer.” Also, if there was a simple cheat-sheet (i.e all the commands and their function) or table of "common errors/issues" that would be very helpful since I found I would run into errors with my terminal occationally. As someone with very little coding experience, I just found this exersize hard to digest and wish it was shorter/more straight forward.


## Problem 1

**20 points**

**Write a script that outputs some user and location data and moves that output to a newly created directory**

Make a single script that prints out a file called question01.txt. 

This file should contain the following text:

  My username is (your username, but the script needs to work for anyone, not just you)

  My home directory is (your home directory, but the script needs to work for anyone, not just you)

  The contents of the tfcb_2023/lectures/lecture04/ directory are

  (prints the contents of that directory)

This script should also create a directory called homework02, and move question01.txt into the homework02 directory.

An example output answer should be:

My username is campbellm <br>
My home directory is /Users/melody <br>
The contents of the tfcb_2023/lectures/lecture04/ directory are<br>
01-first-steps.md<br>
02-directories<br>
03-redirection<br>
04-vim<br>
05-history<br>
06-scripting<br>
07-more-interactive-shell<br>
README.md<br>
quickref.md<br>
sequence.gb<br>
slides<br>
vader.txt<br>
___
#!/bin/bash

USER_NAME=$(whoami)
HOME_DIR=$HOME
OUTPUT_FILE="question01.txt"
TARGET_DIR="tfcb_2023/lectures/lecture04"

{
  echo "My username is $USER_NAME"
  echo
  echo "My home directory is $HOME_DIR"
  echo
  echo "The contents of the $TARGET_DIR directory are"
  echo
  if [ -d "$TARGET_DIR" ]; then
    ls -1 "$TARGET_DIR"
  else
    echo "Directory not found: $TARGET_DIR"
  fi
} > "$OUTPUT_FILE"

mkdir -p homework02
mv "$OUTPUT_FILE" homework02/

echo "Wrote homework02/$OUTPUT_FILE"


## Problem 2

**20 points**

**Write a script that uses a loop to output files with specific names**


Make a single script that does the following:

Makes a new directory in homework02 called question02

In that directory, your script should make 25 new files called
file###.txt

the ### should be the numbers from a list you can find here:

tfcb_2023/homeworks/homework02/list.txt

You can make the contents of those files whatever you want (hint: slide 9... )
___
#!/bin/bash

# Directory to store generated files
TARGET_DIR="homework02/question02"

# Ensure the directory exists
mkdir -p "$TARGET_DIR"

# Path to the list of numbers
LIST_FILE="list.txt"

# Check if the list file exists
if [ ! -f "$LIST_FILE" ]; then
    echo "List file not found: $LIST_FILE"
    exit 1
fi

# Loop through each number in list.txt and create a file
while read -r number; do
    filename="file${number}.txt"
    echo "This is file number $number" > "$TARGET_DIR/$filename"
done < "$LIST_FILE"

echo "Created files in $TARGET_DIR/"

_Paste your SCRIPT here (not the output)_


