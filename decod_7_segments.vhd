library ieee;
use ieee.std_logic_1164.all;

entity decod_7_segments is
port(
	E: in std_logic_vector(3 downto 0);
	S: out std_logic_vector(6 downto 0)
	);
end decod_7_segments;

architecture arch of decod_7_segments is
begin
  
  S <= "1000000" when E = "0000" else --0
          "1111001" when E = "0001" else --1
          "0100100" when E = "0010" else --2
          "0110000" when E = "0011" else --3
          "0011001" when E = "0100" else --4
          "0010010" when E = "0101" else --5 
          "0000010" when E = "0110" else --6
          "1111000" when E = "0111" else --7 
          "0000000" when E = "1000" else --8
          "0011000" when E = "1001" else --9
          "0001000" when E = "1010" else --A
          "0000000" when E = "1011" else --B
          "1000110" when E = "1100" else --C 
          "1000000" when E = "1101" else --D 
          "0000110" when E = "1110" else --E 
          "0001110" when E = "1111" else --F
          "1111111";

end arch;