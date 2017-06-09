#lang scribble/manual
@require[@for-label[racket/base]]

@title{rules}
@author{Sourav Datta}

@defmodule[rules]



@section{Overview}

A simple language to draw automaton rules. A rule specifies the configuration of a single cell in a grid of cells depending upon the state of three cells - (row - 1, col -1), (row - 1, col) and
(row - 1, col + 1).

Here is how we define Rule 30 [http://mathworld.wolfram.com/Rule30.html]

Add `#lang s-exp rules` at the top

@racketblock[
(value 30)
(dimension 451)
(init-conf ((0 225 1)))]

@image["scribblings/rule30.png"]

This will create a grid of 451x451 and place a single on cell at (0, 255). The rest of the grid will be derived by applying Rule 30 repeatedly for each column.


@section{Program stucture}

A pogram is only three lines of code.

The first line is a specification of the rule number @racketblock[(value n)]. The number is converted to an 8 bit binary number and that corresponds to the result states of the
grid configurations. For example rule 30 corresnponds to binary value 00011110, hence, the rule configuration is - (1, 1, 1) -> 0, (1, 1, 0) -> 0, (1, 0, 1) -> 0, (1, 0, 0) -> 1, (0, 1, 1) -> 1, (0, 1, 0) -> 1, (0, 0, 1) -> 1, (0, 0, 0) -> 0.
Alternatively, the first line could be a binary specification of the 8 bits like @racketblock[(binary 0 0 0 1 1 1 1 0)].

The second line specifies the dimension of the board @racketblock[(dimension N)]. This creates a square board of N x N.

The third line gives the initial configuration of the board @racketblock[(init-conf ((row1 col1 1) (row2 col2 0) ...))].

@section{Functions}

@defproc[(value (n positive-integer?))
              void?]{specifies the rule value}

@defproc[(binary (n1 integer?) (n2 integer?)
                 (n3 integer?) (n4 integer?)
                 (n5 integer?) (n6 integer?)
                 (n7 integer?) (n8 integer?))
              void?]{specifies the rule value in binary}

@defproc[(dimension (n positive-integer?))
                    void?]{specifies the size of the square grid}

@defproc[(init-conf (confs list?))
                    void?]{specifies the initial configuration of the grid}

