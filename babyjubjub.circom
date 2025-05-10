pragma circom 2.2.2;

/*
 * BabyJubJub Point Addition Circuit
 * 
 * This circuit implements point addition on the BabyJubJub curve, which is a twisted Edwards curve
 * commonly used in zero-knowledge proofs. The curve equation is:
 * ax^2 + y^2 = 1 + dx^2y^2
 * where a = 168700 and d = 168696
 * 
 * The circuit takes two points (x1,y1) and (x2,y2) as input and outputs their sum (xout,yout).
 * The addition follows the twisted Edwards curve addition formula.
 */
template BabyAdd() {
    // First point (x1, y1)
    signal input x1; 
    signal input y1;

    // Second point (x2, y2)
    signal input x2; 
    signal input y2;
    
    // Resultant point after addition
    signal output xout;  
    signal output yout;

    // Intermediate signals for computation
    signal beta;      // β = x1 * y2
    signal gamma;     // γ = y1 * x2
    signal x2plusy2;  // x2 + y2
    signal x1y1;      // x1 * y1
    signal delta;     // δ = -a * x1 * y1 * (x2 + y2)
    signal tau;       // τ = β * γ
    signal dtau;      // d * τ
    signal den1;      // 1 + d * τ
    signal den2;      // 1 - d * τ

    // BabyJubJub curve parameters
    var a = 168700;  // Coefficient in the curve equation
    var d = 168696;  // Coefficient in the curve equation

    // Step 1: Compute intermediate values
    beta <== x1 * y2;
    gamma <== y1 * x2;
    x2plusy2 <== x2 + y2;
    x1y1 <== x1 * y1;
    delta <== (-a) * x1y1 * x2plusy2;
    tau <== beta * gamma;
    dtau <== d * tau;
    den1 <== 1 + dtau;
    den2 <== 1 - dtau;

    // Step 2: Compute x-coordinate of the sum
    // xout = (β + γ) / (1 + d * τ)
    signal betaplusgamma;
    betaplusgamma <== beta + gamma;
    xout <-- betaplusgamma / den1;
    den1 * xout === betaplusgamma;

    // Step 3: Compute y-coordinate of the sum
    // yout = (δ + a * β - γ) / (1 - d * τ)
    signal abeta;
    signal num2;
    abeta <== a * beta;
    num2 <== delta + abeta - gamma;
    yout <-- num2 / den2;
    den2 * yout === num2;
}