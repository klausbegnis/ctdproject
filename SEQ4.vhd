-----------------------------------
library ieee;
use ieee.std_logic_1164.all;
------------------------------------
entity SEQ4 is
  port ( address : in std_logic_vector(3 downto 0);
         data : out std_logic_vector(17 downto 0) );
end entity;

architecture Rom_Arch of SEQ4 is
  type memory is array (00 to 15) of std_logic_vector(17 downto 0);
  constant my_Rom : memory := (
    00 => "000000011111011001",
    01 => "101000100000011111",
    02 => "000111001101101010",
    03 => "100011000101111000",
    04 => "110111000010010001",
    05 => "000011100110101010",
    06 => "110001101000101010",
    07 => "100101010101011111",
    08 => "100011111000110101",
    09 => "111110000110010000",
    10 => "110000110101010101",
    11 => "101001010100101111",
    12 => "000011101010101101",
    13 => "100011101011100001",
    14 => "100111010100000001",
    15 => "110101110100101010");
	
begin
   process (address) --//o adress vai ser o número da rodada.
   begin
     case address is
       when "0000" => data <= my_rom(00);
       when "0001" => data <= my_rom(01);
       when "0010" => data <= my_rom(02);
       when "0011" => data <= my_rom(03);
       when "0100" => data <= my_rom(04);
       when "0101" => data <= my_rom(05);
       when "0110" => data <= my_rom(06);
       when "0111" => data <= my_rom(07);
       when "1000" => data <= my_rom(08);
       when "1001" => data <= my_rom(09);
       when "1010" => data <= my_rom(10);
       when "1011" => data <= my_rom(11);
       when "1100" => data <= my_rom(12);
       when "1101" => data <= my_rom(13);
       when "1110" => data <= my_rom(14);
       when others => data <= my_rom(15);
       end case;
  end process;
end architecture Rom_Arch;
