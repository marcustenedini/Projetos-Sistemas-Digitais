library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexador is 
    port(
        D: in std_logic_vector(3 downto 0);
        S: in std_logic_vector(1 downto 0);
        Y: out std_logic
    );
end multiplexador;

architecture ntl of multiplexador is

begin
    Y<=(not S(1) and not S(0) and D(0)) or (not S(1) and S(0) and D(1)) or (S(1) and not S(0) and D(2)) or (S(1) and S(0) and D(3));
end ntl;
