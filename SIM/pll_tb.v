`timescale 1ns/1ns

module pll_tb;
    reg sys_clk;
    reg sys_rst_n;
    wire vga_clk;

    pll dut(
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .vga_clk(vga_clk)
    );

    initial sys_clk = 0;
    always #10 sys_clk = ~sys_clk;

    initial begin
        $dumpfile("pll_tb.vcd");
        $dumpvars(0, pll_tb);
        
        sys_rst_n = 0;
        #25 sys_rst_n = 1;

        #260 sys_rst_n = 0;
        #20 sys_rst_n = 1;

        #200 $finish;
    end

endmodule