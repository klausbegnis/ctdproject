library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_signed.all;

entity datapath is
port(sw_entra: in std_logic_vector(17 downto 0);
r1, e1,e2,e3,e4,e5, e6, clk1, clk50, key_entra: in std_logic;
h0, h1, h2, h3, h4, h5, h6, h7: out std_logic_vector(6 downto 0);
led_out: out std_logic_vector (17 downto 0);
end_time, end_bonus, end_round, end_FPGA: out std_logic);
end datapath;



architecture arqdata of datapath is
    
    component mux_2_1 is port
    (
    E: in std_logic;
	A: in std_logic_vector(3 downto 0);
	B: in std_logic_vector(3 downto 0);
    S: out std_logic_vector(3 downto 0)
	);
    end component;

    component mux_2_1_18 is port
    (
    E: in std_logic;
	A: in std_logic_vector(17 downto 0);
	B: in std_logic_vector(17 downto 0);
    S: out std_logic_vector(17 downto 0)
	);
    end component;

begin

-- LEDR 17-0
    ledr170: mux_2_1 port map
    (
        E => e2;
        A => "000000000000000000";
        B =>  led_out
    );


end arqdata;




