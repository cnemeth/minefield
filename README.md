# CrowdFlower Programming Challange

As part of our recruiting process we ask candidates to complete a small
programming assignment. It is technically easy, but is intended to
provide enough scope to allow you to demonstrate your knowledge of good
programming practices. Assume that the code you are producing is
intended for use in our production system.

## Development Notes

• There is no time limit to complete this exercise.
• No user interface is required; the program will be run from the
console and must be written in Ruby.
• Assume that all files (input and output) will be found/created in the
same directory as the program executes
• As part of the exercise, you may choose to write unit tests
appropriate for the task.
• Please submit all components of your work back to me when complete
(source files, test input/output etc)
• Have Fun!

## Exercise

There is a field of mines. Each mine is identified by a 2d-coordinate
and a blast radius. When a mine explodes at time interval t, it explodes
mines that lay within its blast radius at t + 1.

Given a list of mines consisting of their X & Y coordinates and radius
(ex 2, 2, 5), write a program that finds which mine in the list triggers
the most explosions in the fewest number of time intervals. Use the
Euclidean distance to determine whether a mine lays within the radius of
another mine. Your program should produce an output file showing the
results, including identifying the mine that triggers the most intense
explosions.

## A sample mines input

Content of `example_mines.txt`

1 1 1
2 2 1
3 -4 1
0 1 1
1 2 1
5 4 1
-3 -3 1
-2 -1 1
-1 -1 1
10 6 1
9 -3 5
-4 -4 1
-3 1 1
-10 3 5
-2 1 3
0 0 2
1 0 3
1 7 2

--
Cameron Befus
VP Engineering
