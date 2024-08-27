module testbench;
   logic  reset;
   logic clk;
   logic write;
   logic read;   
   logic [`FIFO_WIDTH-1:0] data_in;                  
   logic [`FIFO_WIDTH-1:0] data_out;                  
   logic fifo_empty;
   logic fifo_full;     
   logic [`FIFO_SIZE_BITS-1:0] fifo_counter;
  sync_fifo inst(reset,clk,write,read,data_in,data_out,fifo_empty,fifo_full,fifo_counter);
   always #10 clk=~clk;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
    
  initial begin
    $monitor("Time=%0t counter=%0d full=%0d write_enable=%0d data_in=%0d empty=%0d read_enable=%0d data_out=%0d ",$time,fifo_counter,fifo_full,write,data_in,fifo_empty,read,data_out);
    {clk,write,read,reset}=0;
    #10 reset=1;
    #20 reset=0;
    repeat(16)begin
    #20 write=1; data_in=$urandom_range(0,32);
    end
    #20 read=1;write=0;
    repeat(16)begin
    #20 read=1;
    end
    #20 read=0;
    #200
    $finish;
  end
endmodule
  