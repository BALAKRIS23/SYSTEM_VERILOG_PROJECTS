First In First Out (FIFO) is a very popular and useful design block for purpose of synchronization and a handshaking mechanism between the modules.

Depth of FIFO: The number of slots or rows in FIFO is called the depth of the FIFO.

Width of FIFO: The number of bits that can be stored in each slot or row is called the width of the FIFO.

There are two types of FIFOs

Synchronous FIFO
Asynchronous FIFO
Synchronous FIFO

In Synchronous FIFO, data read and write operations use the same clock frequency. Usually, they are used with high clock frequency to support high-speed systems.

synchronous fifo
Synchronous FIFO Operation
Signals:

wr_en: write enable

wr_data: write data

full: FIFO is full

empty: FIFO is empty

rd_en: read enable

rd_data: read data

w_ptr: write pointer

r_ptr: read pointer

FIFO write operation
FIFO can store/write the wr_data at every posedge of the clock based on wr_en signal till it is full. 

The write pointer gets incremented on every data write in FIFO memory.

FIFO read operation
The data can be taken out or read from FIFO at every posedge of the clock based on the rd_en signal till it is empty. 
The read pointer gets incremented on every data read from FIFO memory.

Synchronous FIFO Verilog Code
A synchronous FIFO can be implemented in various ways. Full and empty conditions differ based on implementation.

Method 1
In this method, the width of the write and read pointer = log2(depth of FIFO). The FIFO full and empty conditions can be determined as

Empty condition
w_ptr == r_ptr i.e. write and read pointers has the same value.

Full condition
The full condition means every slot in the FIFO is occupied, but then w_ptr and r_ptr will again have the same value. 
Thus, it is not possible to determine whether it is a full or empty condition. 
Thus, the last slot of FIFO is intentionally kept empty, and the full condition can be written as (w_ptr+1’b1) == r_ptr).

Method 2
In order to avoid an empty slot as mentioned in method 1, the width of write and read pointers is increased by 1 bit. This extra bit helps determine empty and full conditions when FIFO is empty (w_ptr == r_ptr when all slots are empty) and FIFO is full (w_ptr == r_ptr when all slots are full).

Empty condition
w_ptr == r_ptr i.e. write and read pointers has the same value. MSB of w_ptr and r_ptr also has the same value.

Full condition
w_ptr == r_ptr i.e. write and read pointers has the same value, but the MSB of w_ptr and r_ptr differs.
