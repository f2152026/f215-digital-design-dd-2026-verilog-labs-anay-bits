module tb;

reg [3:0] a;
reg [3:0] b;
reg op;
wire [3:0] result;

alu DUT(
    .a(a),
    .b(b),
    .op(op),
    .result(result)
);

string vcd_file;

initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
        $dumpfile(vcd_file);
        $dumpvars(0, DUT);
    end
end

integer i,j;

initial begin
    
    for(i = 0; i < 16; i++) begin
        for(j = 0; j < 16; j++) begin

            a = i;
            b = j;

            op = 1'b0;
            #1;
            if(result !== (a+b))
                $display("FAIL: ADD a=%b, b=%b, op=%b | result=%b", a,b,op,result);

            op = 1'b1;
            #1;
            if(result !== (a-b))
                $display("FAIL: SUBTRACT a=%b, b=%b, op=%b | result=%b", a,b,op,result);

        end
    end

    $finish;
end

initial begin
    $monitor($time, " a=%b, b=%b, op=%b | result=%b", a,b,op,result);
end

endmodule


