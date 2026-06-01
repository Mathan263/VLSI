interface apb_if(input bit clk);
    logic PRESET_n,PSEL_i,PENABLE_i,PWRITE_i;
    logic [2:0]PADDR_i;
    logic [7:0] PWDATA_i;

    logic PCLK;
    assign PCLK=clk; 

    logic [7:0] PRDATA_o;
    logic PREADY_o, PSLVERR_o;

    clocking apb_drv_cb@(posedge PCLK);
        default input#1 output #1;
        output PRESET_n;
        output PSEL_i;
        output PENABLE_i;
        output PWRITE_i;
        output PADDR_i;
        output PWDATA_i;
        input PRDATA_o;
        input PREADY_o;
        input PSLVERR_o;
    endclocking

    clocking apb_mon_cb@(posedge PCLK);
        default input#1 output #1;
        input PRESET_n;
        input PSEL_i;
        input PENABLE_i;
        input PWRITE_i;
        input PADDR_i;
        input PWDATA_i;
        input PRDATA_o;
        input PREADY_o;
        input PSLVERR_o;
    endclocking

    modport APB_DRV_MP(clocking apb_drv_cb);
    modport APB_MON_MP(clocking apb_mon_cb);
    
    
endinterface
