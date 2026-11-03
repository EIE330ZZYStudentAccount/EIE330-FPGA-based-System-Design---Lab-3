`timescale 1ns/1ns

module vga_top_tb;
    reg sys_clk;
    reg sys_rst_n;
    wire hsync;
    wire vsync;
    wire [15:0] rgb;

    vga_top dut(
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .hsync(hsync),
        .vsync(vsync),
        .rgb(rgb)
    );

    initial sys_clk = 0;
    always #10 sys_clk = ~sys_clk;

        initial begin
        $dumpfile("vga_top_tb.vcd");
        $dumpvars(0, vga_top_tb);

        sys_rst_n = 0;
        #25 sys_rst_n = 1;

        #2500 sys_rst_n = 0;
        #40 sys_rst_n = 1;

        #1700 $finish;
    end



endmodule