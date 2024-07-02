library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench2 is
end entity testbench2;

architecture tb_decoder4x16 of testbench2 is
    component decodificador4x16 is
        port (
            A : in std_logic_vector(3 downto 0);
            Y : out std_logic_vector(15 downto 0)
        );
    end component;

    signal a_1: std_logic_vector(3 downto 0);

begin 
    dec4x16: decodificador4x16
     port map (
        A => a_1,
        Y => open
    );
    estimulo : process 
    begin
        for j in 0 to 16 loop
            a_1 <= std_logic_vector(to_unsigned(j, 4));
            wait for 10 ns;
        end loop;
    end process estimulo;

end architecture tb_decoder4x16;


