library IEEE;
use IEEE.STD_LOGIC_1164 .ALL;

entity topmodule is end;
architecture rtl of topmodule is
    component testbench port(
        i1,i2 : out std_logic_vector(1 downto 0)
    );
end component;
component sum_p is
port(
    A,B : in std_logic_vector(1 downto 0);
    S : out std_logic_vector(2 downto 0)
);
end component;
signal i1aux,i2aux : std_logic_vector(1 downto 0):="00";
begin
somador:sum_p port map(A=>i1aux,B=>i2aux,S=>open);
test:testbench port map(i1 => i1aux,i2=>i2aux);
end rtl;
