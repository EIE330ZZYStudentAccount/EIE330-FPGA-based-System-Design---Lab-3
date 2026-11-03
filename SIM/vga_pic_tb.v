`timescale 1ns/1ns

module vga_pic_tb;
    reg vga_clk;
    reg sys_rst_n;
    reg [9:0] pix_x;
    reg [9:0] pix_y;
    wire [15:0] pix_data;

    vga_pic dut(
        .vga_clk(vga_clk),
        .sys_rst_n(sys_rst_n),
        .pix_x(pix_x),
        .pix_y(pix_y),
        .pix_data(pix_data)
    );



    initial vga_clk = 0;
    always #20 vga_clk = ~vga_clk;

    initial begin
        $dumpfile("vga_pic_tb.vcd");
        $dumpvars(0, vga_pic_tb);

        pix_x = 0;
        pix_y = 0;
        sys_rst_n = 0;
        #25 sys_rst_n = 1;


        #40 pix_x = 10'd432; pix_y = 10'd208;

        #40 pix_x = 10'd432; pix_y = 10'd224;

        #40 pix_x = 10'd160; pix_y = 10'd224;

        #40 pix_x = 10'd208; pix_y = 10'd208;

        #40 pix_x = 10'd240; pix_y = 10'd208;

        #40 pix_x = 10'd256; pix_y = 10'd208;

        #40 sys_rst_n = 0;

        #40 pix_x = 10'd256; pix_y = 10'd264;

        #40 pix_x = 10'd336; pix_y = 10'd208;

        #40 pix_x = 10'd344; pix_y = 10'd208;

        #40 pix_x = 10'd336; pix_y = 10'd224;

        #40 pix_x = 10'd144; pix_y = 10'd208;

        #40 pix_x = 10'd160; pix_y = 10'd208;

        #40 pix_x = 10'd456; pix_y = 10'd224;

        #40 sys_rst_n = 1;

        #40 pix_x = 10'd1023; pix_y = 10'd1023;

        #40 $finish;

    end




endmodule