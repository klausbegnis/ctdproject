library ieee;
use ieee.std_logic_1164.all;

entity controlador is port (
clock,reset,enter, end_fpga, end_bonus, end_time, end_round: in std_logic;
r1, e1, e2, e3, e4, e5, e6: out std_logic );
end controlador;

architecture fsmcontrolador of controlador is
    type STATES is (start, setup, play_fpga, play_user, check, result, next_round, wait1);
    signal EAtual, PEstado: STATES;
begin
    process(clock, reset)
    begin
        if (reset = '1') then
            EAtual <= start;
        elsif (clock'event AND clock = '1') then
            EAtual <= PEstado;
        end if;
    end process;
    process(EAtual, enter, end_fpga, end_bonus, end_time, end_round)
    begin
        case EAtual is
            when start =>
                r1 <= '1';
                e1 <= '0';
                e2 <= '0';
                e3 <= '0';
                e4 <= '0';
                e5 <= '0';
                e6 <= '0';
                PEstado <= setup;
                
            when setup =>
                r1 <= '0';
                e1 <= '1';
                e2 <= '0';
                e3 <= '0';
                e4 <= '0';
                e5 <= '0'; 
                e6 <= '0'; 
                if (enter = '1')  then
                    PEstado <= play_fpga;
                else 
                    PEstado <= EAtual;
                end if;
            when play_fpga =>
                r1 <= '0';
                e1 <= '0';
                e2 <= '1';
                e3 <= '0';
                e4 <= '1';
                e5 <= '0';
                e6 <= '0';   
                if (end_fpga = '1') then
                    PEstado <= play_user;
                else
                    PEstado <= EAtual;
                end if;
            when play_user =>
                r1 <= '0';
                e1 <= '0';
                e2 <= '0';
                e3 <= '1';
                e4 <= '1';
                e5 <= '0';
                e6 <= '0';
                if (end_time = '1') then
                    PEstado <= result;
                end if;
                if (enter = '1') then
                    PEstado <= check;  
                end if;
            when check =>
                r1 <= '0';
                e1 <= '0';
                e2 <= '0';
                e3 <= '1';
                e4 <= '0';
                e5 <= '0';
                e6 <= '0';  
                if (end_round = '1') then
                    PEstado <= result;
                elsif (end_bonus = '1') then
                    PEstado <= result;
                else            
                    PEstado <= next_round;
                end if;
            when next_round =>
                r1 <= '0';
                e1 <= '0';
                e2 <= '0';
                e3 <= '0';
                e4 <= '1';
                e5 <= '0';
                e6 <= '0';  
                PEstado <= wait1;
            when wait1 =>
                r1 <= '0';
                e1 <= '0';
                e2 <= '0';
                e3 <= '0';
                e4 <= '0';
                e5 <= '1';
                e6 <= '0'; 
                if (enter = '1') then
                    PEstado <= play_fpga;
                else
                    PEstado <= EAtual;
                end if;
            when result =>
                r1 <= '0';
                e1 <= '0';
                e2 <= '0';
                e3 <= '0';
                e4 <= '0';
                e5 <= '0';
                e6 <= '1'; 
                if (enter = '1') then
                    PEstado <= start;
                else
                    PEstado <= EAtual;
                end if;
        end case;
    end process;
end fsmcontrolador;               