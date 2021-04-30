library ieee;
use ieee.std_logic_1164.all;

entity mux_4_18 is
port(
    E: in std_logic_vector(1 downto 0);
	A: in std_logic_vector(17 downto 0);
	B: in std_logic_vector(17 downto 0);
    C: in std_logic_vector(17 downto 0);
    D: in std_logic_vector(17 downto 0);
    S: out std_logic_vector(17 downto 0)
	);
end mux_4_18;

architecture arch_mux of mux_4_18 is
begin

  S <= A when E = "00" else
       B when E = "01" else
       C when E = "10" else
       D;

end arch_mux;