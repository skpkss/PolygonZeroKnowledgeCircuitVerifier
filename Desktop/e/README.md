# CustomCircuit.circom Readme

## Description

This repository contains the code for a custom circuit implemented in the Circom language. The `CustomCircuit.circom` code defines a custom logic circuit composed of AND, OR, and NOT gates. This readme provides information on how to understand, use, and run the circuit.

## Prerequisites

Before using the `CustomCircuit.circom` code, make sure you have the following installed on your system:

1. **Node.js**: Circom requires Node.js to be installed as it is used to run the circom compiler. You can download Node.js from the official website: https://nodejs.org/

2. **Circom**: To compile the Circom code, you need the Circom compiler installed globally. You can install it using Node.js package manager (npm) with the following command:

   ```bash
   npm install -g circom
   ```

## Circuit Description

The `CustomCircuit` template represents a custom logic circuit constructed using the AND, OR, and NOT gates.

### Template: `AND`

- Inputs:
  - `a`: Input signal of the AND gate.
  - `b`: Input signal of the AND gate.
- Outputs:
  - `out`: Output signal of the AND gate, which is the result of `a` AND `b`.

### Template: `OR`

- Inputs:
  - `a`: Input signal of the OR gate.
  - `b`: Input signal of the OR gate.
- Outputs:
  - `out`: Output signal of the OR gate, which is the result of `a` OR `b`.

### Template: `NOT`

- Inputs:
  - `in`: Input signal of the NOT gate.
- Outputs:
  - `out`: Output signal of the NOT gate, which is the logical negation of the `in` signal.

### Template: `CustomCircuit`

- Inputs:
  - `a`: Input signal for the custom circuit.
  - `b`: Input signal for the custom circuit.
- Outputs:
  - `q`: Output signal of the custom circuit.

## Getting Started

To get started with the `CustomCircuit.circom` code, follow these steps:

1. Clone this repository to your local machine using the following command:

   ```bash
   git clone <repository_url>
   ```

2. Change into the cloned directory:

   ```bash
   cd <repository_directory>
   ```

3. Review the `CustomCircuit.circom` file to understand the logic and behavior of the custom circuit. Make sure you have a basic understanding of the Circom language and the defined templates.

## Compiling and Running the Circuit

To compile and run the `CustomCircuit.circom` code, follow these steps:

1. Open your terminal or command prompt.

2. Navigate to the directory containing the `CustomCircuit.circom` file.

3. Run the following command to compile the Circom code:

   ```bash
   circom CustomCircuit.circom -r
   ```

   This will generate two files:
   - `circuit.json`: This file contains the compiled arithmetic representation of the circuit.
   - `constraints.json`: This file contains the constraints for the circuit.

4. To run the custom circuit with specific input values, uncomment the `INPUT` object at the end of the `CustomCircuit.circom` file and provide appropriate input values for `a` and `b`.

5. Run the following command to execute the circuit with the provided inputs:

   ```bash
   snarkjs wtns calculate CustomCircuit.r1cs INPUT.json witness.wtns
   ```

   This command will generate a `witness.wtns` file, which is the witness for the circuit.

6. To verify the result of the circuit, run the following command:

   ```bash
   snarkjs groth16 prove CustomCircuit.zkey witness.wtns proof.json public.json
   ```

   This will generate a `proof.json` file, which is the proof of the computation.

7. To verify the proof, use the following command:

   ```bash
   snarkjs groth16 verify CustomCircuit.vkey proof.json public.json
   ```

   If the proof is valid, you will see a success message.

# DEPLOY.ts

This script (`NOW_DEPLOY.ts`) is designed to deploy a smart contract and perform zero-knowledge proof (zkSNARK) verification using the deployed contract. It uses Hardhat for smart contract deployment and the `snarkjs` library to generate and verify the zkSNARK proof. The script reads the necessary input data from the specified directories and files, generates the zkSNARK proof, deploys the smart contract, and verifies the proof on-chain.

## Prerequisites

Before running the `NOW_DEPLOY.ts` script, make sure you have the following installed on your system:

1. **Node.js and npm**: The script uses Node.js and npm to execute the code. You can download Node.js from the official website: https://nodejs.org/

2. **Hardhat**: The script utilizes Hardhat for smart contract deployment. To install Hardhat, use the following command:

   ```bash
   npm install -g hardhat
   ```

3. **snarkjs**: The script uses the `snarkjs` library for generating and verifying zkSNARK proofs. To install `snarkjs`, use the following command:

   ```bash
   npm install -g snarkjs
   ```

## File Structure

Ensure that the following file structure is present for the script to work correctly:

```
./circuits/CustomCircuit/
    |- input.json
    |- out/
        |- circuit.wasm
        |- circuit.wtns
        |- CustomCircuit.zkey
```

## Usage

1. Clone this repository to your local machine.

2. Open a terminal or command prompt and navigate to the cloned repository's root directory.

3. Make sure you have set up the file structure with the required files as described in the "File Structure" section above.

4. Open the `NOW_DEPLOY.ts` file and make any necessary modifications to the paths, file names, and contract name as per your setup.

5. Run the script using the following command:

   ```bash
   npx hardhat run NOW_DEPLOY.ts
   ```

   The script will execute the following steps:

   - Deploy the `Verifier` contract using the provided factory.
   - Generate the zkSNARK proof call data using the `generateCallData` function.
   - Verify the generated zkSNARK proof on the deployed contract using the `verifyProof` function.
   - Display the result of the proof verification.

6. The script will output the address of the deployed `Verifier` contract and the result of the proof verification. If the result is `true`, it indicates that the proof was successfully verified on-chain.
   
