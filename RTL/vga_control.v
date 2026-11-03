`timescale 1ns/1ns

module vga_control(
    input wire vga_clk,
    input wire sys_rst_n,
    input wire [15:0] pix_data,
    output wire [9:0] pix_x,
    output wire [9:0] pix_y,
    output wire hsync,
    output wire vsync,
    output wire [15:0] rgb
);

    reg  [9:0] cnt_h;
    reg  [9:0] cnt_v;
    wire rgb_valid;
    wire pix_data_req;

    always @(posedge vga_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            cnt_h <= 0;
        else if(cnt_h == 10'd799)
            cnt_h <= 0;
        else
            cnt_h <= cnt_h + 1;
    end

    assign hsync = (cnt_h <= 10'd95) ? 1'b1 : 1'b0;

    always @(posedge vga_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            cnt_v <= 0;
        else if((cnt_v == 524) && (cnt_h == 799))
            cnt_v <= 0;
        else if(cnt_h == 799)
            cnt_v <= cnt_v + 1;
        else
            cnt_v = cnt_v;
    end

    assign vsync = (cnt_v <= 10'd1) ? 1'b1 : 1'b0;

    assign rgb_valid =((cnt_h >= 10'd144) && (cnt_h < 10'd784) && (cnt_v >= 10'd35) && (cnt_v < 10'd515)) ? 1'b1 : 1'b0;

    assign pix_data_req =((cnt_h >= 10'd143) && (cnt_h < 10'd783) && (cnt_v >= 10'd35) && (cnt_v < 10'd515)) ? 1'b1 : 1'b0;

    assign pix_x = (pix_data_req == 1'b1) ? (cnt_h - 10'd143) : 10'd1023;
    assign pix_y = (pix_data_req == 1'b1) ? (cnt_v - 10'd35) : 10'd1023;

    assign rgb = (rgb_valid == 1'b1) ? pix_data : 16'b0;


endmodule