# Barrelbot

_v0_8_
29 May 2024

# Table of Contents
[What is BarrelBot?](https://github.com/whimc/Barrelbot/blob/main/readme.md#what-is-barrelbot)

[What is its Purpose?](https://github.com/whimc/Barrelbot/blob/main/readme.md#what-is-its-purpose)

[Overview of Components](https://github.com/whimc/Barrelbot/blob/main/readme.md#overview-of-components)
- Start Area
- Actors
- Course Area
- Instructions
- Functions
- Resource Pack

[How to Make and Use Puzzles](https://github.com/whimc/Barrelbot/blob/main/readme.md#how-to-make-and-use-puzzles)
- Puzzle Functionality
- Making a Puzzle

[Tools](https://github.com/whimc/Barrelbot/blob/main/readme.md#tools)
- Puzzle Wand
- Dev Book
- Cloning




## What is BarrelBot?
BarreblBot is an innovative learning bot created on Minecraft: Java Edition that helps users learn basic fundamentals of programming. The bot is mainly targeted towards children to be used as an introductory tool that integrates gaming with learning. Minecraft: Java Edition was chosen as the base platform due to its world wide popularity and its ease of use for children. 

## What is its Purpose?
BarrelBots aligns with the fundamental goals of a programming system, especially in regards to supporting and encouraging new ways of thinking and enabling programmers to see and understand the execution of their programs. Through the platform, users are able to test out different sets of programming instructions in order to solve and then create their own puzzles. Furthermore, the Barrelbot displays the programming instructions as it moves throughout a task, which allows users to visualize the fruits of their work. They are pushed to think outside the box on how to apply what they know and have learned to future programming work. 


## Overview of Components

### Start Area

<img width="314" alt="Screenshot 2024-03-17 at 10 44 06 PM" src="https://github.com/whimc/Barrelbot/assets/148797817/b7ffd720-ce51-4359-915f-ade84ccabe27">


**Start Button**: 

Used to activate and deactivate the puzzles. Simply click the start button in order to activate the puzzle at which time the overhead display should change from "start" to "reset". Click the button again to reset the puzzle. Appears when a puzzle is created. 

**Hopper**: 

Low capacity storage block that appears as part of the puzzle creation. It automatically collects any items directly above it. 

**Shulker Box**: 

Higher capacity storage block appears as part of the puzzle creation. Main usage is to store instructions that users can collect to complete the puzzle. 

### Actors

**BarrelBot**: 

<img width="116" alt="Screenshot 2024-03-17 at 10 36 18 PM" src="https://github.com/whimc/Barrelbot/assets/148797817/9f98aa27-4142-4db3-ae8c-2aac6dbc25b6">

Innovative learning bot created to allow users to visualize and understand programming fundamentals. The Bot stores instructions the users places into it and then executes them once the puzzle is run. 

Creation/Deletion: 
* Created with Features > Spawn Bot in dev book. It can also now be used as a block that can be placed. 
* Will face the way that you were facing when you spawn it
* Make sure you are not standing directly over the run button when you spawn the bot or it will spawn over the button
* To delete the barrelbot, simply destroy the block or click Features > Delete Bot

**Dispenser Bot**:

<img width="110" alt="Screenshot 2024-03-17 at 10 54 36 PM" src="https://github.com/whimc/Barrelbot/assets/148797817/292eda36-4878-4028-b313-ca28475f4748">

Another type of bot that is an extension of a barrelbot. It is mainly used in the puzzles as "enemies" that users have to avoid in their completion of the puzzle. The bot stores instruction blocks that it executes, but these instructions are locked into the bot unless it is manually converted back to a barrelbot first. 

Creation/Deletion: 
* First, create a barrelbot and load in it any instructions you want the dispenser bot to have
* Once you’ve set it up, stand near it and click Features > Convert to Dispenser
* To make changes, go to Features > Convert to Barrel, make any changes you would like, then convert it back to a dispenser bot
* Destroyed the same way as barrel bots

### Course Area

Puzzle courses are either designed to have users a) solve the puzzle by following a specific path outlined by course blocks or b) give users the freedom to choose how to have their barrelbot move as long as it reaches the success condition. 

a) <img width="343" alt="Screenshot 2024-03-17 at 10 51 02 PM" src="https://github.com/whimc/Barrelbot/assets/148797817/35124ae7-7b67-4409-b95f-1607f70ec641">

b) <img width="422" alt="Screenshot 2024-03-17 at 10 51 30 PM" src="https://github.com/whimc/Barrelbot/assets/148797817/14ceb20e-9a3c-4688-a4e8-a51234f6ff2e">



### Instructions

These are the actual commands the barrelbots execute, and you can give them to yourself in the Instructions tab of the dev book

Most instructions can be acquired without any configuration. These include:

* Move forward
* Move down
* Turn left
* Turn right
* End code block
* Infinite loop

Some instructions require further specifications. They will copy the instruction command to your clipboard, which you will then have to paste in chat and configure by adding text to the command.\
![](instruction-images/instructions-book.png)![](instruction-images/condition-arguments.png)\
These configurable instructions include:

* If statements
    * the instruction command contains two parts: {condition: " ", description: " "}. 
    * {condition:”  ”}
        * this is the condition that the if statement checks for. It is formatted in the same way that the `execute if` subcommand is
        * Example: To check if the block ahead is air, you would insert “`if block ^ ^ ^1 air`” into the condition quotation marks
        * Coordinate guide (these all the characters to place into the condition):
            * Forward: ^ ^ ^1
            * Backwards: ^ ^ ^-1
            * Left: ^1 ^ ^
            * Right: ^-1 ^ ^
            * Up: ~ ~1 ~
            * Down: ~ ~-1 ~
            * [for more information about minecraft coordinates](https://minecraft.fandom.com/wiki/Coordinates) 
    * {description:”  “}
        * The text that shows in the tooltip of the item
        * Just formatted plain text
    * Make sure to use an end block to end the if statement   
* Counter Loops
    * {cycles: }
        * Number of times to repeat the loop
* While loops
    * Configurations the same as If statements


### Functions

Spawns as container block with a message saying "click to link function item"

<img width="394" alt="Screenshot 2024-03-17 at 10 21 58 PM" src="https://github.com/whimc/Barrelbot/assets/148797817/dc19927e-cfce-42a0-9aef-6a3071902300">


You can link a function item by either clicking on the block with the item in your hand or by standing near the function you want to link it to and clicking Features > Link Function Item. In order to link an item to the function, you must rename it, ideally with details as to what the function does, first. 

<img width="232" alt="Screenshot 2024-03-17 at 10 21 33 PM" src="https://github.com/whimc/Barrelbot/assets/148797817/615b2fab-4f71-4a00-ade3-2dd0ea5121cf">
<img width="119" alt="Screenshot 2024-03-17 at 10 21 50 PM" src="https://github.com/whimc/Barrelbot/assets/148797817/e9bd451b-0c98-44c4-b723-d0163931ec97">



You can then place instructions into the function to describe what you would like it to do. 

<img width="227.5" alt="Screenshot 2024-03-17 at 10 22 37 PM" src="https://github.com/whimc/Barrelbot/assets/148797817/7b1800bb-2fa8-48a2-8e0a-f40414fa2455">


Once this is done, you can place the function item in a barrelbot in order to represent your function and have it execute the function instructions. 

<img width="231" alt="Screenshot 2024-03-17 at 10 22 26 PM" src="https://github.com/whimc/Barrelbot/assets/148797817/d324cbce-c4a6-48a7-ab4d-2d20387eb8d9">


Functions can be pre-set and locked by placing a honeycomb onto the function block. To unlock it, click honeycomb again. 

### Resource Pack

The resource pack is a folder on the backend that holds all the custom textures/models/other assets used for barrelbots. Examples of what is held in the resource pack include the face of the barrel bot or the icons for the instructions. 

## How to Make and Use Puzzles

<img width="451" alt="Screenshot 2024-03-17 at 10 43 49 PM" src="https://github.com/whimc/Barrelbot/assets/148797817/6bdb1ec1-c0b1-4d1e-b315-d99a5090cae5">


### Puzzle Functionality 

1. First retrieve the instructions from the shulker box at the start of the puzzle or create your own using the dev book
2. Place the necessary instructions into the barrelbot that allow you to complete the puzzle (you reach the success condition)
3. Click the start button to run the puzzle and watch the barrelbot execute the instructions you gave it
4. To reset the puzzle, click the start button again and this will cause the barrelbot to return to its initial position where you can change any of the instructions if necessary

### Making a Puzzle

**Creating a puzzle**:

All puzzles are defined by a primary puzzle entity, which is located at the puzzle’s activation button. To create a puzzle, open your dev book and click:

Puzzle > Create Puzzle

If there is not already a button there, this will create the button and puzzle entity at your feet. You can break and replace this button without deleting the puzzle, and any button type will work.

**Linking to a puzzle**: 

Whenever you’re editing a puzzle, you should always link yourself to the puzzle that you’re working on. This will ensure that any bots you spawn are linked to that puzzle and will activate when you press the corresponding button. You can do this with:

Puzzle > Link to Puzzle

You will also automatically link to a puzzle when you spawn it.

**Deleting a puzzle**:

To delete a puzzle, simply destroy the puzzle blocks

**Resetting all puzzles**:

You can reset all puzzles using Puzzle > Reset all puzzles.

This will stop any puzzles that were left running and restore a puzzle’s item box to its original state.


**Seeing and changing boundaries**: 

Boundaries are set by placing **light blocks** with a **light level of 0**. When a player touches one of these blocks, any puzzle-bound items in their inventory will be transported back to their appropriate puzzle.

**Adding in barrelbots and dispenser bots**:

To add a barrelbot or dispenser bot to the puzzle, make sure you are first linked to the puzzle or in the puzzle boundry (which automatically will cause the barrelbot to link to the puzzle). Then simply place the barrelbot/dispenser bot as specified above, and it will then be automatically linked to the puzzle. 

**Attaching instructions to a puzzle/Setting Puzzle Itemse**:

If you want to restrict a puzzle to only allow a specific set of items or add instructions to a puzzle, you can do the following:

1. Keep track of which direction you were facing when you spawned the puzzle (you can check this by pressing f3+b, and a blue line will appear facing the direction the puzzle entity is facing
2. Put a yellow shulker box (or other container block) 1 block behind and 1 block below the puzzle
3. Place a hopper to the left of the shulker box facing it
4. Place any items you want the puzzle to have in the shulker box
5. Click Puzzle > Set Puzzle Items

These items are now bound to a puzzle. If a player in survival mode tries to take items out of the boundaries of the puzzle, they will get transported back to the hopper and filtered back into the shulker box.

**Customized instructions**:

*to be added*

**Success conditions**:

The puzzle manager is coded to have configurable success conditions, so we can have different ways of measuring whether a puzzle is “complete”, like having all barrel bots land on a green space, or delivering a cake to a certain location.

To set a puzzle’s success condition, stand near it and click Puzzle > Set Success Condition. Paste the command into chat, and replace the `“”` at the end with the success condition’s name.

Currently, there is only one success condition: 

`touch\_green`
  Puzzle is successful if all bots are standing on a green space

[Technical] Adding a New Success Condition:

1. Navigate to the success conditions folder
    1. data > whimc > functions > barrelbot > success\_conditions
2. Create a new function file
    1. The name of the function is the id of the success condition
    2. Ex: deliver\_cake.mcfunction
3. Program success condition
    1. Your function communicates by editing the scoreboard player`$success whimc.dummy`
    2. `scoreboard players set $success whimc.dummy 1`communicates success
    3. `scoreboard players set $success whimc.dummy 0`communicates failure


## Tools
### Puzzle Wand 

*note: the wand is still a work in progress, but the goal is to have it completely replace the dev book*

The wand allows you to tinker with the features of a puzzle. Simply **right click** while holding the wand to scan for an editable feature. If an editable feature is found, it will bring up an editing menu. To exit this menu, press the left shift button or **crouch**. You need to be out of interaction range with objects that you can open or press.

Command: `/loot give @s loot whimc:edit_wand`

*note: if the @s gives a "selector not allowed" error, replace it with your username*


<img width="849" alt="Screenshot 2024-02-29 at 10 54 23 PM" src="https://github.com/whimc/Barrelbot/assets/148797817/e053657f-bb09-49f2-a9ab-b51797eba1fb">


**List of Editable Features in the Wand and How They Can be Edited (WIP):**

#### Barrelbot:
Swap dispenser/barrel: converts the barrelbot between barrel and dispenser form. Dispensers have their items locked and are meant to be part of the puzzle ratehr than something to interface/work with directly.


#### Puzzle Button:

Scanning a puzzle button will automatically link you to that puzzle. The puzzle you’re linked to will show a purple indicator over it whenever you’re holding an edit wand.

<img width="140.5" alt="Screenshot 2024-02-29 at 10 58 01 PM" src="https://github.com/whimc/Barrelbot/assets/148797817/87529e38-c47c-4650-be0e-47a986aebd93">



Toggle size editor: allows you to edit the size of the puzzle. Use the puzzle wand on the start button and click on the yellow stained glass pane that appears (see image above). This will display a yellow boundry. Right click and drag the yellow block that appears to change the size of the puzzle boundry.

Propagate changes: any changes made to this puzzle will be copied over to any clones of the puzzle as well. This feature is currnetly indicated by an orange stained glass pane. 


#### Block Commands:

Puzzle Button: `/function whimc:barrelbot/block/puzzle_button/give`

Barrelbot: `/function whimc:barrelbot/block/barrelbot/give`

Function: `/function whimc:barrelbot/block/function/give`


### Dev Book 

The dev book allows access to all developer functions. 
To give yourself the dev book, type the following command chat:

`/function whimc:barrelbot/dev/give_dev_book`

### Cloning 

*note: still in the process of being transferred to the wand*

Basic Clone: Clone the puzzle you are currently linked to by going to the dev book **Clone** page and selecting start clone. You can create the new clone puzzle by selecting Clone > Paste Puzzle.

Cascade Clone: Creates a 2-dimensional array of clones of the puzzle you are currently linked to. To perform a cascade clone:
   1) Link to a puzzle by selecting it with a puzzle wand
   2) In the dev book, select clone > cascade clone. This will bring up a menu
   3) Specify the dimensions of the array in the x and z direction (negative numbers will paste that many clones in the negative x/z direction)
   4) Specify the spacing between puzzles in the x/z direction
   5) Click "paste" (note: preview button does not currently do anything)
