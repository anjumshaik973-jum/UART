# UART (Universal Asynchronous Receiver Transmitter)

## Overview
This project implements a basic UART Transmitter and Receiver using Verilog HDL. UART is a serial communication protocol widely used in embedded systems, microcontrollers, FPGAs, and ASICs.

## Objectives
- Design a UART Transmitter (TX)
- Design a UART Receiver (RX)
- Verify functionality using a testbench
- Simulate the design and analyze waveforms

## Features
- 8-bit Data Transmission
- 1 Start Bit
- 1 Stop Bit
- Serial Communication
- RTL Design in Verilog
- Functional Verification using Testbench

## Project Files

- uart_tx.v       : UART Transmitter
- uart_rx.v       : UART Receiver
- uart_top.v      : Top Module
- uart_tb.v       : Testbench
- README.md       : Project Documentation

## UART Frame Format

Start Bit | Data Bits (8-bit) | Stop Bit

      0    D0 D1 D2 D3 D4 D5 D6 D7    1

## Tools Used

- Verilog HDL
- EDA Playground
- Icarus Verilog
- GTKWave / EPWave

## Simulation

1. Compile all Verilog files.
2. Run the simulation.
3. Observe the waveform.
4. Verify that transmitted data equals received data.
