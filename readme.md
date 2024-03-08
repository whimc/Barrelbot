# Barrelbot

_v0_5_

# Table of Contents
[What is BarrelBot?] (link)
[What is its Purpose?] (link)
[Overview of Components] (link)
[How to Make and Use Puzzles] (link)


## What is BarrelBot?

## What is its Purpose?

## Overview of Components

## How to Make and Use Puzzles





##  Dev book

To give yourself the dev book, type the following command chat (all developer functions are contained within this):

`/function whimc:barrelbot/dev/give_dev_book`

The following sections detail how to use the dev book

## Creating a puzzle

All puzzles are defined by a primary puzzle entity, which is located at the puzzle’s activation button. To create a puzzle, open your dev book and click:

Puzzle > Create Puzzle

If there is not already a button there, this will create the button and puzzle entity at your feet. You can break and replace this button without deleting the puzzle, and any button type will work.

## Puzzle Linking

Whenever you’re editing a puzzle, you should always link yourself to the puzzle that you’re working on. This will ensure that any bots you spawn are linked to that puzzle and will activate when you press the corresponding button. You can do this with:

Puzzle > Link to Puzzle

You will also automatically link to a puzzle when you spawn it.

## Deleting a puzzle

Delete the puzzle *nearest to you* with:

Puzzle > Delete Puzzle

## Spawning/Deleting Bots and other features

Under the Features tab, you’ll find a list of spawnable features. They will automatically link to whatever puzzle you’re currently linked to

* Barrelbot
    * Created with Features > Spawn Bot
    * Will face the way that you were facing when you spawn it
    * Make sure you are not standing directly over the run button when you spawn the bot or it will spawn over the button
    * To delete the barrelbot, click Features > Delete Bot
* Function
    * Spawns as container block with a message saying "click to link function item"
    * You can link a function item by either clicking on the block with the item in your hand or by standing near the function you want to link it to and clicking Features > Link Function Item
* Dispenser bot
    * First, create a barrelbot and load in it any instructions you want the dispenser bot to have
    * Once you’ve set it up, stand near it and click Features > Convert to Dispenser
    * To make changes, go to Features > Convert to Barrel, make any changes you would like, then convert it back to a dispenser bot
    * Destroyed the same way as barrel bots

## Instructions

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
    * {description:”  “}
        * The text that shows in the tooltip of the item
        * Just formatted plain text, no need for JSON shenanigans
* Counter Loops
    * {cycles: }
        * Number of times to repeat the loop
    * To-do: add while loops with configurable condition statements
* While loops
    * Configurations the same as If statements

## Puzzle Success Conditions

The puzzle manager is coded to have configurable success conditions, so we can have different ways of measuring whether a puzzle is “complete”, like having all barrel bots land on a green space, or delivering a cake to a certain location.

## Setting a success condition for a puzzle

To set a puzzle’s success condition, stand near it and click Puzzle > Set Success Condition. Paste the command into chat, and replace the `“”` at the end with the success condition’s name.

## List of success conditions

Currently, there is only one success condition

`touch\_green`
  Puzzle is successful if all bots are standing on a green space

## [Technical] Adding a new success condition

1. Navigate to the success conditions folder
    1. data > whimc > functions > barrelbot > success\_conditions
2. Create a new function file
    1. The name of the function is the id of the success condition
    2. Ex: deliver\_cake.mcfunction
3. Program success condition
    1. Your function communicates by editing the scoreboard player`$success whimc.dummy`
    2. `scoreboard players set $success whimc.dummy 1`communicates success
    3. `scoreboard players set $success whimc.dummy 0`communicates failure

## Setting Puzzle Items

If you want to restrict a puzzle to only allow a specific set of items, you can do the following:

1. Keep track of which direction you were facing when you spawned the puzzle (you can check this by pressing f3+b, and a blue line will appear facing the direction the puzzle entity is facing
2. Put a yellow shulker box (or other container block) 1 block behind and 1 block below the puzzle
3. Place a hopper to the left of the shulker box facing it
4. Place any items you want the puzzle to have in the shulker box
5. Click Puzzle > Set Puzzle Items

These items are now bound to a puzzle. If a player in survival mode tries to take items out of the boundaries of the puzzle, they will get transported back to the hopper and filtered back into the shulker box.

## Setting boundaries

Boundaries are set by placing **light blocks** with a **light level of 0**. When a player touches one of these blocks, any puzzle-bound items in their inventory will be transported back to their appropriate puzzle.

## Resetting all puzzles

You can reset all puzzles using Puzzle > Reset all puzzles.

This will stop any puzzles that were left running and restore a puzzle’s item box to its original state.

________________________________________
## [WIP]Editor 2.0
The puzzle editing interface is currently undergoing a major overhaul. All of the old documentation will be kept for the time being until it’s been fully phased out, but when possible using these new features is recommended (and easier!)

## Puzzle Wand
Command: `/loot give @s loot whimc:edit_wand`

*note: if the @s gives a "selector not allowed" error, replace it with your username*

The wand allows you to tinker with the features of a puzzle. Simply **right click** while holding the wand to scan for an editable feature. If an editable feature is found, it will bring up an editing menu. To exit this menu, press the left shift button or **crouch**. You need to be out of interaction range with objects that you can open or press.

<img width="849" alt="Screenshot 2024-02-29 at 10 54 23 PM" src="https://github.com/whimc/Barrelbot/assets/148797817/e053657f-bb09-49f2-a9ab-b51797eba1fb">


## List of Editable Features and How They Can be Edited (WIP):

**Barrelbot**:
Swap dispenser/barrel: converts the barrelbot between barrel and dispenser form. Dispensers have their items locked and are meant to be part of the puzzle ratehr than something to interface/work with directly.

*(WIP) Additions to be made: change face/expression, lock the bot*

**Puzzle Button**:

Scanning a puzzle button will automatically link you to that puzzle. The puzzle you’re linked to will show a purple indicator over it whenever you’re holding an edit wand.

<img width="281" alt="Screenshot 2024-02-29 at 10 58 01 PM" src="https://github.com/whimc/Barrelbot/assets/148797817/87529e38-c47c-4650-be0e-47a986aebd93">


Toggle size editor: allows you to edit

*note: this feature currently does not have an icon, and is instead indicated by a yellow stained glass pane*

Propagate changes: any changes made to this puzzle will be copied over to any clones of the puzzle as well

*note: this feature is currently indicated by an orange stained glass pane*

**Block Commands**

Puzzle Button: `/function whimc:barrelbot/block/puzzle_button/give`

Barrelbot: `/function whimc:barrelbot/block/barrelbot/give`

Function: `/function whimc:barrelbot/block/function/give`

## Cloning Changes

*note: still in the process of being transferred to the wand*

**Basic Clone**: Clone the puzzle you are currently linked to by going to the dev book **Clone** page and selecting start clone. You can create the new clone puzzle by selecting Clone > Paste Puzzle.

**Cascade Clone**: Creates a 2-dimensional array of clones of the puzzle you are currently linked to. To perform a cascade clone:
   1) Link to a puzzle by selecting it with a puzzle wand
   2) In the dev book, select clone > cascade clone. This will bring up a menu
   3) Specify the dimensions of the array in the x and z direction (negative numbers will paste that many clones in the negative x/z direction)
   4) Specify the spacing between puzzles in the x/z direction
   5) Click "paste" (note: preview button does not currently do anything)




