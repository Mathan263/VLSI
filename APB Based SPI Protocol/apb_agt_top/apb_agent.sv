class apb_agent extends uvm_agent;
    `uvm_component_utils(apb_agent)
    function new(string name="apb_agent", uvm_component parent=null);
        super.new(name,parent);
    endfunction

    apb_monitor monh;
    apb_sequencer seqrh;
    apb_driver drvh;

    apb_agent_config m_apb_cfg;

    function void build_phase(uvm_phase phase);
        if(!uvm_config_db#(apb_agent_config)::get(this,"","apb_agent_config",m_apb_cfg))
            `uvm_fatal("CONFIG DB", "Not getting apb config in apb_agent")

        monh=apb_monitor::type_id::create("monh",this);
        if(m_apb_cfg.is_active==UVM_ACTIVE)
        begin
            drvh=apb_driver::type_id::create("drvh",this);
            seqrh=apb_sequencer::type_id::create("seqrh",this);
        end

    endfunction

    function void connect_phase(uvm_phase phase);
        if(m_apb_cfg.is_active==UVM_ACTIVE)
            drvh.seq_item_port.connect(seqrh.seq_item_export);
    endfunction


endclass

