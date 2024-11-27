# 5-Staged-Pipelined-RISC-V-32I-Processor
5 stage pipeline implementation of RISC-V 32I Processor.
In this repository, I have implemented a 5-stage pipelined processor. This project displays the design and implementation of a processor with pipelining, showing the transition from a theoretical single-cycle processor design to an efficient pipelined architecture.

For 5 staged pipelining, we'll divide our instruction into 5 different stages:
* Instruction Fetch
* Instruction Decode
* Instruction Execution
* Memory Read/Write
* Write Back
  
This pipelined implementation of processor supports six basic instructions:
* R-Type
* I-Type
* S-Type
* B-Type
* J-Type
* U-Type <br>
A Hazard Unit has been implemented in this design to handle both data hazards and control hazards in the pipelined processor architecture.
# Architecture
We will add four registers in between the complete datapath. These registers store and track different parts of instructions as they pass through the pipeline. They make sure the instructions are properly moved through all five stages so they can execute correctly. This setup ensures the needed data is available to each stage at the right time for proper execution.
![image](https://github.com/user-attachments/assets/cbbb7163-a9d1-4dff-8df3-c15852db8c57)
#Design Modules
