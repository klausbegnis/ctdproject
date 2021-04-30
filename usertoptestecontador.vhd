library ieee;
use ieee.std_logic_1164.all;

entity usertop is
port(
	KEY: in std_logic_vector(3 downto 0);
	CLK_1Hz: in std_logic;
	SW: in std_logic_vector(17 downto 0);
	LEDR: out std_logic_vector(17 downto 0);
	HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7	: out std_logic_vector(6 downto 0)
	);
end usertop;

architecture rtl of usertop is

    component counter_4_bits is port
    (
        Data: in std_logic_vector(3 downto 0);
        R: in std_logic;
        E: in std_logic;
        clk: in std_logic;
        F: out std_logic_vector(3 downto 0);
        tc: out std_logic
    );
    end component;

begin
    
    contador: counter_4_bits port map
    (
        Data => "1010",
        R => SW(1),
        E => SW(0),
        clk => CLK_1Hz,
        F => LEDR(3 downto 0),
        tc => LEDR(17)
    );
    

end rtl;