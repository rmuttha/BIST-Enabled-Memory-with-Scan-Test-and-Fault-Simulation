# BIST-Enabled Memory with Scan Test and Fault Simulation

This project includes Verilog code for designing a BIST-enabled memory module with scan test capabilities and fault simulation. The project demonstrates the integration of scan test plans, fault modeling, ATPG, and validation of test patterns on a complex design.

## Files and Modules

1. **`memory_bist.v`**: Memory module with Built-In Self-Test (BIST) functionality.
2. **`scan_chain.v`**: Scan chain module for scan-based testing.
3. **`fault_modeling.v`**: Fault modeling module for stuck-at fault simulation.
4. **`testbench.v`**: Testbench to simulate and verify the functionality of the BIST, scan chain, and fault detection.

## Simulation

To simulate the design:
1. Compile all Verilog files (`memory_bist.v`, `scan_chain.v`, `fault_modeling.v`, and `testbench.v`) using a Verilog simulator like ModelSim or Vivado.
2. Run the simulation and observe the waveforms to verify the functionality of the BIST, scan chain, and fault detection mechanisms.

## Usage

- **Memory BIST**: A memory module with built-in self-test capability, including test pattern generation and fault detection.
- **Scan Chain**: A simple scan chain implementation for shift-based testing.
- **Fault Modeling**: Module to simulate stuck-at faults and demonstrate fault detection using test vectors.
- **Testbench**: Provides a complete test environment for verifying the memory BIST, scan chain, and fault modeling.

## Author

- Rutuja Muttha
  (rmuttha@pdx.edu)
