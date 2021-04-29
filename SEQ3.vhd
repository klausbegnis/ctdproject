-----------------------------------
library ieee;
use ieee.std_logic_1164.all;
------------------------------------
entity SEQ3 is
  port ( address : in std_logic_vector(3 downto 0);
         data : out std_logic_vector(17 downto 0) );
end entity;

architecture Rom_Arch of SEQ3 is
  type memory is array (00 to 15) of std_logic_vector(17 downto 0);
  constant my_Rom : memory := (
	00 => "000000110000111110",
	01 => "000000011111100111",
   	02 => "101111100000110000",
	03 => "100001111001111000",
	04 => "111100001100100100",
	05 => "001010010000001111",
	06 => "111000010010101010",
	07 => "000000000011111111",
	08 => "000111100001111100",
	09 => "111000001110010010",
	10 => "100100111000011110",
	11 => "100011100001110001",
	12 => "000011001110011010",
	13 => "000101101101101110",
	14 => "111000101001000100",
	15 => "100010001000101111");
	
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
