
library IEEE;
use IEEE.std_logic_1164.all;

entity sum is 
    port (
        A, B, Cin : in std_logic;
        S, Cout   : out std_logic
    );
end sum;

architecture main of sum is
begin
    S    <= A xor B xor Cin;
    Cout <= (A and B) or (A and Cin) or (B and Cin);
end main;