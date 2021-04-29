-----------------------------------
library ieee;
use ieee.std_logic_1164.all;
------------------------------------
entity SEQ2 is
  port ( address : in std_logic_vector(3 downto 0);
         data : out std_logic_vector(17 downto 0) );
end entity;

architecture Rom_Arch of SEQ2 is
  type memory is array (00 to 15) of std_logic_vector(17 downto 0);
  constant my_Rom : memory := (
	00 => "010001000011111001",
	01 => "100010011100110011",
   	02 => "010101000011111000",
	03 => "111001010100001111",
	04 => "011001110011110000",
	05 => "011100100011100101",
	06 => "100011001110000111",
	07 => "000111100100110101",
	08 => "000110110011110010",
	09 => "000011011100011100",
	10 => "100011011100010100",
	11 => "000111001001100111",
	12 => "100110011100010111",
	13 => "010011100111000111",
	14 => "100001111000111111",
	15 => "111111111111111111");
	
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
