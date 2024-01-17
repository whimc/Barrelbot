# Barrelbot

_v0_4_

##  Dev book

To give yourself the dev book, type the following command chat (all developer functions are contained within this):

`/function whimc:barrelbot/dev/give_dev_book`

The following sections detail how to use the dev book

## Creating a puzzle

All puzzles are defined by a primary ## puzzle entity, which is located at the puzzle’s activation button. To create a puzzle, open your dev book and click:

* Puzzle &gt; Create Puzzle

If there is not already a button there, this will create the button and puzzle entity at your feet. You can break and replace this button without deleting the puzzle, and any button type will work.

## Puzzle Linking

Whenever you’re editing a puzzle, you should always link yourself to the puzzle you’re working on. This will ensure that any bots you spawn are linked to that puzzle and will activate when you press the corresponding button. You can do this with:

`Puzzle &gt; Link to Puzzle`

You will also automatically link to a puzzle when you spawn it.

## Deleting a puzzle

Delete the puzzle *nearest to you* with:

`Puzzle &gt; Delete Puzzle`

## Spawning/Deleting Bots and other features

Under the Features tab, you’ll find a list of spawnable features. They will automatically link to whatever puzzle you’re currently linked to

* Barrelbot
    * Will face the way that you were facing when you spawn it
* Function
    * Currently spawned as a barrel, but can be swapped out with any container block (will probably use shulker boxes as the convention)
    * To obtain an item linked to the function, hold the item of choice in your mainhand with the book in your offhand, stand near the function you want to link it to, then click Features &gt; Link Function Item
* Dispenser bot
    * First, create a barrelbot and load in it any instructions you want the dispenser bot to have
    * Once you’ve set it up, stand near it and click Features &gt; Convert to Dispenser
    * To make changes, go to Features &gt; Convert to Barrel, make you changes, then convert it back to a barrel bot
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

Some instructions require further specifications. They will copy the command to your clipboard, which you will have to paste in chat then configure by adding text to the command.\
![](./pasted+image+0+1.png)![](./pasted+image+0+2.png)\
These configurable instructions include:

* If statements
    * {condition:”  ”}
        * The condition the if statement checks for. Formatted in the same way the `execute if` subcommand is
        * Example: To check if the block ahead is air, you would insert“`if block ^ ^ ^1 air`”
        * Coordinate guide:
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

To set a puzzle’s success condition, stand near it and click Puzzle &gt; Set Success Condition. Paste the command into chat, and replace the `“”` at the end with the success condition’s name.

## List of success conditions

Currently, there is only one success condition

`touch\_green`
  Puzzle is successful if all bots are standing on a green space

## [Technical] Adding a new success condition

1. Navigate to the success conditions folder
    1. data &gt; whimc &gt; functions &gt; barrelbot &gt; success\_conditions
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
5. Click Puzzle &gt; Set Puzzle Items

These items are now bound to a puzzle. If a player in survival mode tries to take items out of the boundaries of the puzzle, they will get transported back to the hopper and filtered back into the shulker box.

## Setting boundaries

Boundaries are set by placing **light blocks** with a **light level of 0**. When a player touches one of these blocks, any puzzle-bound items in their inventory will be transported back to their appropriate puzzle.

## Resetting all puzzles

You can reset all puzzles using Puzzle &gt; Reset all puzzles.

This will stop any puzzles that were left running and restore a puzzle’s item box to its original state.
