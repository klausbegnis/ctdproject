library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all; 

entity counter_round is
port(
		DATA: in std_logic_vector(3 downto 0);
		SET: in std_logic;
		SET_VALUE: in std_logic_vector(3 downto 0);
		E: in std_logic;
		clk: in std_logic;
		tc: out std_logic;
		ronda: out std_logic_vector(3 downto 0)
	);
end counter_round;

architecture rtl of counter_round is
	signal counter: std_logic_vector(3 downto 0);
	signal set_value_minus: std_logic_vector(3 downto 0);
begin
	set_value_minus <= SET_VALUE - 1;
	process (clk, set)
	begin
		if set = '1' then
			counter <= set_value_minus;
		elsif (clk'event and clk = '1') then
			if E = '1' then
				counter <= counter - 1;
			else
				counter <= counter;
			end if;
		end if;
	end process;

	process (counter)
	begin
		if counter = DATA then
			tc <= '1';
		else
			tc <= '0';
		end if;
	end process;


end rtl;