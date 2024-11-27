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

# RTL View:
![rtl vie_page-0001](https://github.com/user-attachments/assets/c8922a06-af2f-4415-a7ff-fd75ac79c491)

## Instructions Used:
addi x1, x0, 0xA	    00a00513
addi x2, x0, 0x5	    00500593
addi x3, x0, 0xF	    00f00613
add x4, x1, x2	      002081b3
xor x5, x4, x3	      0031a233
or x6, x4, x3        	0031b233
and x7, x5, x6	      0062b333
sll x8, x7, 2	        0023b3b3
srl x9, x8, 1	        0013c3b3
sw x4, 0x100(x0)	    00412023
sw x5, 0x104(x0)	    005120a3
lw x10, 0x100(x0)    	00012283
lw x11, 0x104(x0)   	00412303
slt x12, x10, x11   	00b26333
bne x12, x0, Skip	    fe221ce3
addi x13, x0, 0xFF	  0ff00693
sub x14, x11, x10	    40a36333
mul x15, x14, x3	    0033e3b3

# Simulation Results
![sim1](https://github.com/user-attachments/assets/8200b374-569f-4efc-8076-6a795114cbde)
![sim2](https://github.com/user-attachments/assets/63aef183-cac5-4fe6-b8d0-a217deb7a509)
![sim3](https://github.com/user-attachments/assets/3a48fda7-7390-4266-9983-112e561da53a)
![sim5](https://github.com/user-attachments/assets/ede61faf-d743-4618-b134-3a94c966e46f)
