  module tb;
  
    reg [1:0] a,b;
    wire gt, lt, eq;

    comp2 DUT(

      .A(a),
      .B(b),
      .GT(gt),
      .LT(lt),
      .EQ(eq)

    );

      // Waveform dump configuration (DO NOT CHANGE)
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, DUT);
    end
  end
  
  integer i,j;

  initial begin

    for(i = 0; i < 4; i++) begin
      for(j = 0; j < 4; j++) begin

        a = i;
        b = j;
        #5;

        if(a > b) begin
          if(gt !== 1 || lt !== 0 || eq !== 0)
            $display("FAIL: a=%b, b=%b | gt=%b, lt=%b, eq=%b", a,b,gt,lt,eq);
        end

        if(a<b) begin
          if(gt !== 0 || lt !== 1 || eq !== 0)
            $display("FAIL: a=%b, b=%b | gt=%b, lt=%b, eq=%b", a,b,gt,lt,eq);
        end

        if(a==b) begin
          if(gt !== 0 || lt !== 0 || eq !== 1)
            $display("FAIL: a=%b, b=%b | gt=%b, lt=%b, eq=%b", a,b,gt,lt,eq);
        end

      end
    end

  end

  initial
    $monitor($time, " a=%b, b=%b | gt=%b, lt=%b, eq=%b", a,b,gt,lt,eq); // change as required


  endmodule


