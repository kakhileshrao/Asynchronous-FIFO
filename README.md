# Asynchronous-FIFO

-This repository contains verilog code and testbench for an asynchronous FIFO.

-The FIFO code is parameterized so that FIFOs of different depths can be synthesized using the same code.

-Gray code encoding and dual flop synchronizer is used for avoiding metastability when transferring the data pointers across clock domains.

-The testbench feeds the design with 80 MHz write frequency and 50 MHz read frequency with burst length of 120.
