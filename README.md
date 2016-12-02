# CrowdFlower Programming Challange

As part of our recruiting process we ask candidates to complete a small
programming assignment. It is technically easy, but is intended to
provide enough scope to allow you to demonstrate your knowledge of good
programming practices. Assume that the code you are producing is
intended for use in our production system.

## Development Notes

- There is no time limit to complete this exercise.
- No user interface is required; the program will be run from the
console and must be written in Ruby.
- Assume that all files (input and output) will be found/created in the
same directory as the program executes
- As part of the exercise, you may choose to write unit tests
appropriate for the task.
- Please submit all components of your work back to me when complete
(source files, test input/output etc)
- Have Fun!

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

Cameron Befus
VP Engineering

## Development Notes

The `Minefield` program follows the standard for a Ruby gem. The gemspec file contains the dependencies with one exception,
 the RubyTree gem, which is a forked gem and is listed in the Gemfile. The RubyTree gem was forked in order to update its gems,
JSON in particular, so it could be used in this application.

## Running the Program

Below is a sample output running the program.
```
$ bin/minefield example_mines.txt
I, [2016-12-07T19:28:10.511151 #20055]  INFO -- : Processing file: example_mines.txt
I, [2016-12-07T19:28:10.511399 #20055]  INFO -- : Processing data ...
I, [2016-12-07T19:28:10.512936 #20055]  INFO -- : Writing output file ... ~/workspace/minefield/tmp/results/result_2016-12-07T19:28:10-08:00.txt
```
The input file, `example_mines.txt`, is located in the project root directory, and the output file is saved to `tmp/results` as shown.

### Sample output file

The output file contains the tree representation of the most intensive explosion. The root of the tree is the mine that set off the explosion chain
represented by the child nodes in the tree. The format of the output file is JSON.
```
{
  "root_node": "MINE_1_0_3",
  "content": "#<Minefield::Mine:0x007fb4d7de89e0>",
  "json_class": "Tree::TreeNode",
  "child_nodes": [
    {
      "name": "MINE_1_1_1",
      "content": "#<Minefield::Mine:0x007fb4d7de9660>",
      "json_class": "Tree::TreeNode"
    },
    {
      "name": "MINE_2_2_1",
      "content": "#<Minefield::Mine:0x007fb4d7de9598>",
      "json_class": "Tree::TreeNode"
    },
    {
      "name": "MINE_0_1_1",
      "content": "#<Minefield::Mine:0x007fb4d7de9408>",
      "json_class": "Tree::TreeNode"
    },
    {
      "name": "MINE_1_2_1",
      "content": "#<Minefield::Mine:0x007fb4d7de9340>",
      "json_class": "Tree::TreeNode"
    },
    {
      "name": "MINE_-1_-1_1",
      "content": "#<Minefield::Mine:0x007fb4d7de9020>",
      "json_class": "Tree::TreeNode",
      "children": [
        {
          "name": "MINE_-2_-1_1",
          "content": "#<Minefield::Mine:0x007fb4d7de90e8>",
          "json_class": "Tree::TreeNode"
        }
      ]
    },
    {
      "name": "MINE_0_0_2",
      "content": "#<Minefield::Mine:0x007fb4d7de8aa8>",
      "json_class": "Tree::TreeNode"
    }
  ]
}
```

## Running Specs

```
$ bin/rake
```
or
```
$ bin/rspec
```
As of this writing the specs are running green.

Csaba Nemeth
cnemth9@gmail.com
