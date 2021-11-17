// Module to generate a slow clock
// Reducing frequency from 100Mhz (for Basys3) to 1Hz 
// Creating a 1-second clock

module slowClock(clk, reset, new_clk);
input clk, reset;
output new_clk;

reg new_clk = 1'b0;
reg [27:0] counter;

always@(posedge reset or posedge clk)

begin
    if (reset == 1'b1)
        begin
            new_clk <= 0;
            counter <= 0;
        end
    else
        begin
            counter <= counter + 1;
            if ( counter == 50_000_000)
                begin
                    counter <= 0;
                    new_clk <= ~new_clk;
                end
        end
end
endmodule
