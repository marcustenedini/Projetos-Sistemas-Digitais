library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somadorcompleto is port(
    a,b,cin : in STD_LOGIC;
    cout,s: out STD_LOGIC
);
end somadorcompleto;

architecture ntl of somadorcompleto is

begin
    s <= a xor b xor cin;
    cout <= (a and b) or (a and cin) or (b and cin);
end ntl;


