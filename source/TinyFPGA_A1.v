module TinyFPGA_A1 (
  inout wire pin1,
  inout wire pin2,
  inout wire pin3_sn,
  inout wire pin4_mosi,
  inout wire pin5,
  inout wire pin6,
  inout wire pin7_done,
  inout wire pin8_pgmn,
  inout wire pin9_jtgnb,
  inout wire pin10_sda,
  inout wire pin11_scl,
  //inout wire pin12_tdo,
  //inout wire pin13_tdi,
  //inout wire pin14_tck,
  //inout wire pin15_tms,
  inout wire pin16,
  inout wire pin17,
  inout wire pin18_cs,
  inout wire pin19_sclk,
  inout wire pin20_miso,
  inout wire pin21,
  inout wire pin22
);

wire clk;

OSCH #(
	.NOM_FREQ("2.08")
)	internal_oscillator_inst(
	.STDBY(1'b0),
	.OSC(clk)
);

wire [7:0] nothing_input = 0;
wire [7:0] nothing_output;
wire [7:0] io_config  = 0; // Needs configuration 1 out, 0 in. 

tt04_design test_design(
    .ui_in({pin1, pin2, pin3_sn, pin4_mosi, pin5, pin6, pin7_done, pin8_pgmn}),

    .uo_out({pin9_jtgnb, pin10_sda, pin11_scl, nothing_output[7:3]}),  

    .uio_in({pin16, pin17, pin18_cs, pin19_sclk, pin20_miso, nothing_input[2:0]}),

    .uio_out(nothing_output),  
    .uio_oe(io_config),   
    .ena(pin21),      
    .clk(clk),      
    .rst_n(pin22)     
);

endmodule