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

    component counter_round is port
    (
        DATA: in std_logic_vector(3 downto 0);
		SET: in std_logic;
		SET_VALUE: in std_logic_vector(3 downto 0);
		E: in std_logic;
		clk: in std_logic;
		tc: out std_logic;
		ronda: out std_logic_vector(3 downto 0)
    );
    end component;

begin
    
    contador: counter_round port map
    (
        DATA => "0000",
		SET => SW(1),
		SET_VALUE => "1111",
		E => SW(0),
		clk => CLK_1Hz,
		tc => LEDR(17),
		ronda => LEDR(3 downto 0)
    );
    

end rtl;