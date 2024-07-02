library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench1 is
    end entity testbench1;
    
    architecture tb_multiplexador8x1 of testbench1 is
        component multiplexador8x1 is
            port (
                D: in std_logic_vector(7 downto 0);
                S: in std_logic_vector(2 downto 0);
                Y: out std_logic
            );
        end component;
    
        signal a_1: std_logic_vector(7 downto 0);
        signal sel_1: std_logic_vector(2 downto 0);
    begin 
        mux8x1: multiplexador8x1
         port map (
            D => a_1,
            S => sel_1,
            Y => open
        );
        estimulo : process 
        begin
                for j in 0 to 7 loop
                        sel_1 <= std_logic_vector(to_unsigned(j, 3));
                        for i in 0 to 255 loop
                        a_1 <= std_logic_vector(to_unsigned(i, 8));
                        wait for 10 ns;
                    end loop;
                end loop;
        end process estimulo;
    
end architecture tb_multiplexador8x1;
