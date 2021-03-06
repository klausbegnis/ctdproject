library ieee;
use ieee.std_logic_1164.all;

entity mux_2_1 is
port(
    E: in std_logic;
	A: in std_logic_vector(6 downto 0);
	B: in std_logic_vector(6 downto 0);
    S: out std_logic_vector(6 downto 0)
    
	);
end mux_2_1;

architecture arch_mux of mux_2_1 is
begin

  S <= A when E = '0' else
       B;

end arch_mux;