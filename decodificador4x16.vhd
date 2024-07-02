library ieee;
use ieee.std_logic_1164.all;

entity decodificador4x16 is 
    port(
    A : in std_logic_vector(3 downto 0);
    Y : out std_logic_vector(15 downto 0)
    );
end  decodificador4x16;

architecture decoder of decodificador4x16 is

begin 
with A select 
Y <= X"0001" when "0000",
     X"0002" when "0001",
     X"0004" when "0010",
     X"0008" when "0011",
     X"0010" when "0100",
     X"0020" when "0101",
     X"0040" when "0110",
     X"0080" when "0111",
     X"0100" when "1000",
     X"0200" when "1001",
     X"0400" when "1010",
     X"0800" when "1011",
     X"1000" when "1100",
     X"2000" when "1101",
     X"4000" when "1110",
     X"8000" when "1111",
     X"0000" when others;
end decoder;

