pragma circom 2.2.2;

include "babyjubjub.circom";

template Main() {
    // Input signals
    signal input x1;
    signal input y1;
    signal input x2;
    signal input y2;

    // Output signals
    signal output xout;
    signal output yout;

    // Instantiate the BabyAdd component
    component babyAdd = BabyAdd();
    
    // Connect the signals
    babyAdd.x1 <== x1;
    babyAdd.y1 <== y1;
    babyAdd.x2 <== x2;
    babyAdd.y2 <== y2;
    
    // Connect the outputs
    xout <== babyAdd.xout;
    yout <== babyAdd.yout;
}

component main = Main(); 