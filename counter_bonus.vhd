library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all; 

entity counter_bonus is
port(
		DATA: in std_logic_vector(5 downto 0);
		SET: in std_logic;
		SET_VALUE: in std_logic_vector(5 downto 0);
		E: in std_logic;
		clk: in std_logic;
		tc: out std_logic;
		BONUS: out std_logic_vector(5 downto 0)
	);
end counter_bonus;

architecture rtl of counter_bonus is
	signal counter: std_logic_vector(5 downto 0);
	signal set_value_minus: std_logic_vector(5 downto 0);
begin
	process (clk, set)
	begin
		if SET = '1' then
			counter <= SET_VALUE;
		elsif (clk'event and clk = '1') then
			if E = '1' then
				counter <= counter - DATA;
			else
				counter <= counter;
			end if;
		end if;
	end process;

	process (counter)
	begin
		if counter < 0 then
			tc <= '1';
		else
			tc <= '0';
		end if;
	end process;

	BONUS <= counter;


end rtl;