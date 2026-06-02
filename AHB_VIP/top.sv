

module top;

	import uvm_pkg::*;

	`include "uvm_macros.svh"



	import ahb_pkg::*;



	bit clk;

	always

	begin

		    #5 clk=0;

            #5 clk=1;

	end



	ahb_if AHB_IF(clk);



	initial

	begin

			uvm_config_db#(virtual ahb_if)::set(null,"*","ahb_if",AHB_IF);

			run_test();

	end

    property p1;

        @(posedge AHB_IF.HCLK) (!AHB_IF.HREADY)|=> $stable(AHB_IF.HADDR) && $stable(AHB_IF.HBURST) && $stable(AHB_IF.HSIZE) && $stable(AHB_IF.HTRANS) && $stable(AHB_IF.HWRITE);

    endproperty



    AP1: assert property (p1);

    CP1: cover property(p1);







endmodule
