library ieee;
use ieee.std_logic_1164.all;

entity mux8x1 is 
    port (
        D: in std_logic_vector(7 downto 0);
        S:    in std_logic_vector(2 downto 0);
        Y:      out std_logic
    );
end mux8x1;

architecture behavior of mux8x1 is 
    component mux4x1 
        port (
            a, b, c, d:  in std_logic;
            sel:        in std_logic_vector(1 downto 0);
            y:          out std_logic
        );
    end component;

    signal y1, y2: std_logic;

begin 
    U1: mux4x1 port map (a => D(0), b => D(1), c => D(2), d => D(3), sel => S(1 downto 0), y => y1);
    U2: mux4x1 port map (a => D(4), b => D(5), c => D(6), d => D(7), sel => S(1 downto 0), y => y2);
    U3: mux4x1 port map (a => y1, b => y2, c => '0', d => '0', sel => S(2 downto 1), y => open);
end behavior;
