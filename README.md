# BabyJubJub Twisted Edwards Curve Circuit

This repository contains a Circom circuit implementation for point addition on the BabyJubJub curve, which is a twisted Edwards curve commonly used in zero-knowledge proofs.

## Circuit Details

The circuit implements point addition on the BabyJubJub curve with the equation:

```
ax^2 + y^2 = 1 + dx^2y^2

```

where:

- a = 168700
- d = 168696

## Features

- Point addition circuit for BabyJubJub curve
- Implemented in Circom 2.2.2
- Follows twisted Edwards curve addition formula

## Requirements

- Circom 2.2.2 or later
- Node.js (for development)

## Usage

The circuit takes two points (x1,y1) and (x2,y2) as input and outputs their sum (xout,yout) following the twisted Edwards curve addition formula.

## License

MIT
