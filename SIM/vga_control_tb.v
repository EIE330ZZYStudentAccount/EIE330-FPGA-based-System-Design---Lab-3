`timescale 1ns/1ns

module vga_control_tb;
    reg vga_clk;
    reg sys_rst_n;
    reg [15:0] pix_data;
    wire [9:0] pix_x;
    wire [9:0] pix_y;
    wire hsync;
    wire vsync;
    wire [15:0] rgb;

    vga_control dut (
        .vga_clk   (vga_clk),
        .sys_rst_n (sys_rst_n),
        .pix_data  (pix_data),
        .pix_x     (pix_x),
        .pix_y     (pix_y),
        .hsync     (hsync),
        .vsync     (vsync),
        .rgb       (rgb)
    );

    initial vga_clk = 0;
    always #20 vga_clk = ~vga_clk;

    initial begin
        $dumpfile("vga_control_tb.vcd");
        $dumpvars(0, vga_control_tb);

        pix_data = 16'hF800;
        sys_rst_n = 0;
        #25 sys_rst_n = 1;

        #2500 sys_rst_n = 0;
        #40 sys_rst_n = 1;

        #1700 $finish;
    end

endmodule