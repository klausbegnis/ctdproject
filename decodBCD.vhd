library ieee;
use ieee.std_logic_1164.all;

entity decodBCD is
port(
	E: in std_logic_vector(3 downto 0);
	S: out std_logic_vector(7 downto 0)
	);
end decodBCD;

architecture arch of decodBCD is
begin
  
  S <=  "00000000" when E = "0000" else --0
        "00000001" when E = "0001" else --1
        "00000010" when E = "0010" else --2
        "00000011" when E = "0011" else --3
        "00000100" when E = "0100" else --4
        "00000101" when E = "0101" else --5 
        "00000110" when E = "0110" else --6
        "00000111" when E = "0111" else --7 
        "00001000" when E = "1000" else --8
        "00001001" when E = "1001" else --9
        "00010000" when E = "1010" else --10
        "00010001" when E = "1011" else --11
        "00010010" when E = "1100" else --12
        "00010011" when E = "1101" else --13
        "00010100" when E = "1110" else --14
        "00010101";

end arch;