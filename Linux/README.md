# Linux Project

<p>
  This repository contains my course project for the subject "Introduction to Linux and Shell Scripting" for the academic year 2023-24 at the Manipal Institute of Technology, Manipal, India.
</p>

## Problem Statement

Jack Nash wishes to create the Power calculator interface in Linux. He must implement a shell script to perform the following tasks:

### Task 1: Alpha Power

Create a shell script that begins with a banner **"Unleash the Power Calculator"** displayed and a menu with the options:

#### Alpha Power (AP):
- Accept a word and number from the user. Ensure the entered word is between the range of 7 to 9 characters.
- Choose middle letter and display the word with middle letter as many times as number indicates.  
  *(Hint: abcdefg, 3-> abcdddefg)*
- Store in file **Alpha.txt** with fields **word, number, and modified word** for every try.

#### Expo Power (EP):
- Read Task 2

##### Exit (9):
- Check if the user wishes to terminate or continue.

### Task 2: Expo Power Time

- The script must prompt **"Enter the base number:"** (base).  
  Only positive integers allowed with a range between **2 and 6**.
- Next prompt **"Enter exponent:"** (expo).  
  Both positive and negative exponents allowed.
- Next prompt **"What's your guess for (base) to the power of (expo)?"**  
  Accept the guess.
- Calculate the base (expo) and compare if the guessed value and the calculated value are the same.
- If found the same, message  
  **"Congratulations, you are a power player!"**
- Otherwise, the game terminates with an appropriate message  
  **"Game Over, you lose, low on power, time to recharge!"**  
  and terminate.
- Store valid data in a text file **LiPowerFile.txt** before terminating or choosing another option.


### Note

**LiPowerFile.txt** must contain the following fields:

- serial_no
- basenumber
- exponent
- guess
- matches

Each try must be recorded.
