library verilog;
use verilog.vl_types.all;
entity reciprocal is
    port(
        clock           : in     vl_logic;
        req             : in     vl_logic;
        x               : in     vl_logic_vector(7 downto 0);
        n_iter          : in     vl_logic_vector(3 downto 0);
        x_inv           : out    vl_logic_vector(15 downto 0);
        ack             : out    vl_logic
    );
end reciprocal;
