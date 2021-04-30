library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity counter_4_bits is
port(
	Data: in std_logic_vector(3 downto 0);
    R: in std_logic;
    E: in std_logic;
    clk: in std_logic;
    F: out std_logic_vector(3 downto 0);
    tc: out std_logic
	);
end counter_4_bits;

architecture rtl of counter_4_bits is

signal count: std_logic_vector(3 downto 0) := "0000";

begin
    process (clk, R)
    begin
        if r = '1' then
            count <= "0000";
        elsif (clk'event and clk = '1') then
            if E = '1' then
                count <= count + 1;
            else
                count <= count;
            end if;
        end if;
    end process;
    process (count)
    begin
        if Data = count then
            tc <= '1';
        else
            tc <= '0';
        end if;
    end process;

    F <= count;  

end rtl;