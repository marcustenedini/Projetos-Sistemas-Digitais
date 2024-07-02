library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
    port(
        i1, i2 : out std_logic_vector(1 downto 0) := "00"
    );
end testbench;
architecture rtl of testbench is
    signal i_1, i_2 : std_logic_vector(1 downto 0) := "00";
begin
    i_1(0) <= not i_1(0) after 1 ns;
    i_2(0) <= not i_2(0) after 2 ns;
    i_1(1) <= not i_1(1) after 4 ns;
    i_2(1) <= not i_2(1) after 8 ns;
    i1(0) <= i_1(0);
    i1(1) <= i_1(1);    
    i2(0) <= i_2(0);
    i2(1) <= i_2(1);
end rtl;

