# MU0-CPU
A 16 bit Microprocessor written in Verilog to be executed on an FPGA board.

MU0 Processor Documentation
Overview
The MU0 processor is a 16-bit microprocessor featuring a 16-bit Arithmetic Logic Unit (ALU), address bus, and data bus. It is designed for educational purposes and simple computational tasks. This document provides a comprehensive overview of its architecture, instruction set, and operational details.

Architecture
Components
Arithmetic Logic Unit (ALU)

16-bit width
Supports basic arithmetic operations (addition, subtraction)
Logical operations (AND, OR, NOT)
Registers

Accumulator (ACC): 16-bit register used for arithmetic and logical operations.
Program Counter (PC): 16-bit register holding the address of the next instruction to be executed.
Memory Address Register (MAR): 16-bit register holding the address of memory being accessed.
Memory Data Register (MDR): 16-bit register holding the data being transferred to or from memory.
Instruction Register (IR): 16-bit register holding the currently executing instruction.
Buses

Address Bus: 16-bit unidirectional bus used to address memory locations.
Data Bus: 16-bit bidirectional bus used to transfer data between the processor and memory.
Control Unit

Decodes instructions and generates control signals for other components.
Memory
The MU0 processor uses a simple memory model where instructions and data share the same memory space.
Supports a maximum of 2^16 memory locations (64 KB).
Instruction Set
The MU0 processor uses a simple instruction set designed for basic computational tasks. Instructions are encoded in a 16-bit format.

Instruction Format
Each instruction consists of an opcode and an operand:

Opcode: Specifies the operation to be performed (4 bits).
Operand: Address or data for the operation (12 bits).
Instruction Types
Data Movement Instructions

LDA address: Load the value from the specified address into the ACC.
STA address: Store the value from the ACC into the specified address.
Arithmetic Instructions

ADD address: Add the value from the specified address to the ACC.
SUB address: Subtract the value from the specified address from the ACC.
Control Instructions

JMP address: Jump to the specified address (unconditional).
JGE address: Jump to the specified address if the ACC is greater than or equal to zero (conditional).
JNE address: Jump to the specified address if the ACC is not zero (conditional).
STP: Stop execution.

