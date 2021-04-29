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
    


end fsmcontrolador;               

                
                
                
                
                