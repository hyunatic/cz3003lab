module datapathtest;

//input
reg clk;
reg rst;
reg [31:0]inst;

//output
wire [63:0] aluout;

//Instatiate the unit under test (UUT)
datapath_mux uut(
    .clk(clk),
    .rst(rst),
    .inst(inst),
    .aluout(aluout)
);

always #15 clk= ~clk;

    initial begin
    //Initialize inputs
    clk = 0;
    rst = 0;
    inst = 0;

    //Wait 100ns for global reset to finish
    #100
    #20 rst=1;
    #70 rst=0;
    //Add stimulus here

    #100 inst=32'h00040023; //ADD x3, x1, x4
    #100 inst=32'h00220024; //SUB x4, x1, x2
    //#100 inst=32'h006200E8; //XOR x8, x7, x2