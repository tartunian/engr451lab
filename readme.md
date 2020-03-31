# ENGR451 Lab
These labs are part of ENGR451 Digital Signal Processing at SFSU.
The majority of these projects build upon each other by appending functionality to the Sequence object type defined in `sequence.m`. The Sequence object is composed of a numerical array *data*, and an *offset*. Together, these form an object which represent a set of discrete digital sample values.
## Projects
 - MATLAB Tutorial
 - Convolution I
 - Convolution II
 - DTFT
 - z Transform
## Sequence.m Features
 - `flip(x)` flips the Sequence across the origin
 - `shift(x,n0)` shifts the offset of the Sequence by `n0` units to the right
 - `plus(x,y)` adds two Sequences together
 - `minus(x,y)` subtracts Sequence y from Sequence x
 - `times(x,y)` multiplies Sequences x and y, item by item. Can also be used with scalars
 - `even(x)` returns the even component of the signal
 - `odd(x)` returns the odd component of the signal
 - `conj(x)` conjugates the Sequence term by term
 - `conv(x,h)` convolves Sequence x with another Sequence h
 - `deconv(y,h)`  undoes the convolution of two sequences x and h. Takes in the convolution result y and the impulse response h and returns x.
 - `trim(x)` removes leading and trailing zeros. Updates the offset accodingly.
