library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_signed.all;

entity datapath is
port(sw_entra: in std_logic_vector(17 downto 0);
r1, e1,e2,e3,e4,e5, e6, clk1, clk50, key_entra: in std_logic;
h0, h1, h2, h3, h4, h5, h6, h7: out std_logic_vector(6 downto 0);
led_out: out std_logic_vector (17 downto 0);
end_time, end_bonus, end_round, end_FPGA: out std_logic);
end datapath;



architecture arqdata of datapath is
    
    component mux_2_1 is port
    (
    E: in std_logic;
	A: in std_logic_vector(6 downto 0);
	B: in std_logic_vector(6 downto 0);
    S: out std_logic_vector(6 downto 0)
	);
    end component;

    component mux_2_1_18 is port
    (
    E: in std_logic;
	A: in std_logic_vector(17 downto 0);
	B: in std_logic_vector(17 downto 0);
    S: out std_logic_vector(17 downto 0)
	);
    end component;

    component decod_7_segments is port
    (
	E: in std_logic_vector(3 downto 0);
	S: out std_logic_vector(6 downto 0)
	);
    end component;

    signal SEQ_FPGA: std_logic_vector(17 downto 0);
    signal h70, h71, h60, h61, h50, h51, h40, h41, h30, h31, h20, h21, h10, h11, h00, h01: std_logic_vector(6 downto 0);
    signal dec7h6, dec7h4,dec7h2_00,dec7h2_10,dec7h2_11,dec7h1_01,dec7h1_10,dec7h1_11,dec7h0_00,dec7h0_01,dec7h0_10,dec7h0_11: std_logic_vector(6 downto 0);
    signal tempo: std_logic_vector(3 downto 0);
    signal bonus: std_logic_vector(5 downto 0);
    signal setup: std_logic_vector(13 downto 0);
    signal ronda: std_logic_vector(3 downto 0);
    signal F_POINTS, U_POINTS: std_logic_vector(11 downto 0);
    signal entry_dec_4: std_logic_vector(3 downto 0);
    signal ROUND_BCD: std_logic_vector(7 downto 0);


begin

    F_POINTS <= "00" & ronda & bonus;
    U_POINTS <= "00" & ronda & bonus;
    entry_dec_4 <= "00" & setup(5 downto 4);

-- LEDR 17-0
    ledr170: mux_2_1_18 port map
    (
        E => e2,
        A => "000000000000000000",
        B =>  SEQ_FPGA,
        S => led_out
    );

-- MULTIPLEXADORES PARA HEXADECIMAIS
    mux_h7_0: mux_2_1 port map
    (
        E => e5,
        A => "1000111",
        B => "0101111",
        S => h70
    
	);

    mux_h7_1: mux_2_1 port map
    (
        E => e5,
        A => "0001110",
        B => "1000001",
        S => h71
    
    );

   mux_h7: mux_2_1 port map
   (
       E => e6,
       A => h70,
       B => h71,
       S => h7
   
    );

   mux_h6_0: mux_2_1 port map
   (
       E => e5,
       A => dec7h6,
       B => "0100011",
       S => h60
   
    );

    mux_h6_1: mux_2_1 port map
   (
       E => e5,
       A => "0001100",
       B => "0010010",
       S => h61
   
    );

    mux_h6: mux_2_1 port map
   (
       E => e6,
       A => h60,
       B => h61,
       S => h6
   
    );

    mux_h5_0: mux_2_1 port map
   (
       E => e5,
       A => "1100000",
       B => "1100011",
       S => h50
   
    );

    mux_h5_1: mux_2_1 port map
   (
       E => e5,
       A => "0010000",
       B => "0000110",
       S => h51
   
    );

    mux_h5: mux_2_1 port map
   (
       E => e6,
       A => h50,
       B => h51,
       S => h5
   
    );

    mux_h4_0: mux_2_1 port map
   (
       E => e5,
       A => dec7h4,
       B => "0101011",
       S => h40
   
    );

    mux_h4_1: mux_2_1 port map
   (
       E => e5,
       A => "0001000",
       B => "0101111",
       S => h41
   
    );

    mux_h4: mux_2_1 port map
   (
       E => e6,
       A => h40,
       B => h41,
       S => h4
   
    );

    mux_h3_0: mux_2_1 port map
   (
       E => e5,
       A => "0000111",
       B => "0100001",
       S => h30
   
    );

    mux_h3_1: mux_2_1 port map
   (
       E => e5,
       A => "0110111",
       B => "0110111",
       S => h31
   
    );

    mux_h3: mux_2_1 port map
   (
       E => e6,
       A => h30,
       B => h31,
       S => h3
   
    );

    mux_h2_0: mux_2_1 port map
   (
       E => e5,
       A => dec7h2_00,
       B => "0110111",
       S => h20
   
    );

    mux_h2_1: mux_2_1 port map
   (
       E => e5,
       A => dec7h2_10,
       B => dec7h2_11,
       S => h21
   
    );

    mux_h2: mux_2_1 port map
   (
       E => e6,
       A => h20,
       B => h21,
       S => h2
   
    );

    mux_h1_0: mux_2_1 port map
   (
       E => e5,
       A => "0000011",
       B => dec7h1_01,
       S => h10
   
    );

    mux_h1_1: mux_2_1 port map
   (
       E => e5,
       A => dec7h1_10,
       B => dec7h1_11,
       S => h11
   
    );

    mux_h1: mux_2_1 port map
   (
       E => e6,
       A => h10,
       B => h11,
       S => h1
   
    );

    mux_h0_0: mux_2_1 port map
   (
       E => e5,
       A => dec7h0_00,
       B => dec7h0_01,
       S => h00
   
    );

    mux_h0_1: mux_2_1 port map
   (
       E => e5,
       A => dec7h0_10,
       B => dec7h0_11,
       S => h01
   
    );

    mux_h0: mux_2_1 port map
   (
       E => e6,
       A => h00,
       B => h01,
       S => h0
   
    );

    -- DECODERS PARA HEXADECIMAIS

    decod_dec7h6: decod_7_segments port map
    (
        E => setup(9 downto 6),
	    S => dec7h6
    );


    decod_dec7h4: decod_7_segments port map
    (
        E => entry_dec_4,
	    S => dec7h4
    );

    decod_dec7h2_00: decod_7_segments port map
    (
        E => tempo,
	    S => dec7h2_00
    );

    decod_dec7h2_10: decod_7_segments port map
    (
        E => F_POINTS(11 downto 8),
	    S => dec7h2_10
    );

    decod_dec7h2_11: decod_7_segments port map
    (
        E => U_POINTS(11 downto 8),
	    S => dec7h2_11
    );

    decod_dec7h1_01: decod_7_segments port map
    (
        E => ROUND_BCD(7 downto 4),
	    S => dec7h1_01
    );

    decod_dec7h1_10: decod_7_segments port map
    (
        E => F_POINTS(7 downto 4),
	    S => dec7h1_10
    );

    decod_dec7h1_11: decod_7_segments port map
    (
        E => U_POINTS(7 downto 4),
	    S => dec7h1_11
    );

    decod_dec7h0_00: decod_7_segments port map
    (
        E => bonus(3 downto 0),
	    S => dec7h0_00
    );

    decod_dec7h0_01: decod_7_segments port map
    (
        E => ROUND_BCD(3 downto 0),
	    S => dec7h0_01
    );

    decod_dec7h0_10: decod_7_segments port map
    (
        E => F_POINTS(3 downto 0),
	    S => dec7h0_10
    );

    decod_dec7h0_11: decod_7_segments port map
    (
        E => U_POINTS(3 downto 0),
	    S => dec7h0_11
    );



end arqdata;
