# Development Notes

The `Minefield` program uses a forked version of the RubyTree gem. Updating the gems in RubyTrre,
JSON in particular, was neccessary so it could be used in this application.

## Running the Program

Below is a sample output running the program.
```
$ bin/minefield example_mines.txt
I, [2016-12-07T19:28:10.511151 #20055]  INFO -- : Processing file: example_mines.txt
I, [2016-12-07T19:28:10.511399 #20055]  INFO -- : Processing data ...
I, [2016-12-07T19:28:10.512936 #20055]  INFO -- : Writing output file ... ~/workspace/minefield/tmp/results/result_2016-12-07T19:28:10-08:00.txt
```
The input file, `example_mines.txt`, is located in the project root directory, and the output file is saved to `tmp/results` as shown.

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
