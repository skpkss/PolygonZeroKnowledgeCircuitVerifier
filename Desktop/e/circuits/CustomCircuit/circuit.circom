pragma circom 2.0.0;  

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

template CustomCircuit () {  
      //signal inputs
        signal input a;
        signal input b;
      //signal from gates
        signal x;
        signal y;
      //final signal output
        signal output q;
      //component gates used to create custom circuit
        component a_gate=AND();
        component n_gate=NOT();
        component o_gate=OR();
      //circuit logic
        a_gate.a <== a;
        a_gate.b <== b;
        x <== a_gate.out;

        n_gate.in <== b;
        y <== n_gate.out;

        o_gate.a <== x;
        o_gate.b <== y;
        q <== o_gate.out;

        log("q =",q);
}

component main = CustomCircuit();

/* INPUT = {
    "a": "0",
    "b": "1"
} */