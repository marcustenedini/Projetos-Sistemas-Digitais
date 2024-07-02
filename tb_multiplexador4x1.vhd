library ieee;
use ieee.std_logic_1164.all;

entity testbench1 is
end entity testbench1;

architecture tb_multiplexador4x1 of testbench1 is
    component multiplexador is
        port (
            D: in std_logic_vector(3 downto 0);
            S: in std_logic_vector(1 downto 0);
            Y: out std_logic
        );
    end component;

    signal a_1: std_logic_vector(3 downto 0);
    signal sel_1: std_logic_vector(1 downto 0);
begin 
    mux4x1: multiplexador port map (
        D => a_1,
        S => sel_1,
        Y => open
    );

    estimulo : process 
    begin
                       wait for 5 ns; a_1 <= "0000"; sel_1 <= "00";
                wait for 5 ns; a_1 <= "0001"; sel_1 <= "00";
                wait for 5 ns; a_1 <= "0010"; sel_1 <= "00";
                wait for 5 ns; a_1 <= "0011"; sel_1 <= "00";
                wait for 5 ns; a_1 <= "0100"; sel_1 <= "00";
                wait for 5 ns; a_1 <= "0101"; sel_1 <= "00";
                wait for 5 ns; a_1 <= "0110"; sel_1 <= "00";
                wait for 5 ns; a_1 <= "0111"; sel_1 <= "00";
                wait for 5 ns; a_1 <= "1000"; sel_1 <= "00";
                wait for 5 ns; a_1 <= "1001"; sel_1 <= "00";
                wait for 5 ns; a_1 <= "1010"; sel_1 <= "00";
                wait for 5 ns; a_1 <= "1011"; sel_1 <= "00";
                wait for 5 ns; a_1 <= "1100"; sel_1 <= "00";
                wait for 5 ns; a_1 <= "1101"; sel_1 <= "00";
                wait for 5 ns; a_1 <= "1110"; sel_1 <= "00";
                wait for 5 ns; a_1 <= "1111"; sel_1 <= "00";

                wait for 5 ns; a_1 <= "0000"; sel_1 <= "01";
                wait for 5 ns; a_1 <= "0001"; sel_1 <= "01";
                wait for 5 ns; a_1 <= "0010"; sel_1 <= "01";
                wait for 5 ns; a_1 <= "0011"; sel_1 <= "01";
                wait for 5 ns; a_1 <= "0100"; sel_1 <= "01";
                wait for 5 ns; a_1 <= "0101"; sel_1 <= "01";
                wait for 5 ns; a_1 <= "0110"; sel_1 <= "01";
                wait for 5 ns; a_1 <= "0111"; sel_1 <= "01";
                wait for 5 ns; a_1 <= "1000"; sel_1 <= "01";
                wait for 5 ns; a_1 <= "1001"; sel_1 <= "01";
                wait for 5 ns; a_1 <= "1010"; sel_1 <= "01";
                wait for 5 ns; a_1 <= "1011"; sel_1 <= "01";
                wait for 5 ns; a_1 <= "1100"; sel_1 <= "01";
                wait for 5 ns; a_1 <= "1101"; sel_1 <= "01";
                wait for 5 ns; a_1 <= "1110"; sel_1 <= "01";
                wait for 5 ns; a_1 <= "1111"; sel_1 <= "01";

                wait for 5 ns; a_1 <= "0000"; sel_1 <= "10";
                wait for 5 ns; a_1 <= "0001"; sel_1 <= "10";
                wait for 5 ns; a_1 <= "0010"; sel_1 <= "10";
                wait for 5 ns; a_1 <= "0011"; sel_1 <= "10";
                wait for 5 ns; a_1 <= "0100"; sel_1 <= "10";
                wait for 5 ns; a_1 <= "0101"; sel_1 <= "10";
                wait for 5 ns; a_1 <= "0110"; sel_1 <= "10";
                wait for 5 ns; a_1 <= "0111"; sel_1 <= "10";
                wait for 5 ns; a_1 <= "1000"; sel_1 <= "10";
                wait for 5 ns; a_1 <= "1001"; sel_1 <= "10";
                wait for 5 ns; a_1 <= "1010"; sel_1 <= "10";
                wait for 5 ns; a_1 <= "1011"; sel_1 <= "10";
                wait for 5 ns; a_1 <= "1100"; sel_1 <= "10";
                wait for 5 ns; a_1 <= "1101"; sel_1 <= "10";
                wait for 5 ns; a_1 <= "1110"; sel_1 <= "10";
                wait for 5 ns; a_1 <= "1111"; sel_1 <= "10";

                wait for 5 ns; a_1 <= "0000"; sel_1 <= "11";
                wait for 5 ns; a_1 <= "0001"; sel_1 <= "11";
                wait for 5 ns; a_1 <= "0010"; sel_1 <= "11";
                wait for 5 ns; a_1 <= "0011"; sel_1 <= "11";
                wait for 5 ns; a_1 <= "0100"; sel_1 <= "11";
                wait for 5 ns; a_1 <= "0101"; sel_1 <= "11";
                wait for 5 ns; a_1 <= "0110"; sel_1 <= "11";
                wait for 5 ns; a_1 <= "0111"; sel_1 <= "11";
                wait for 5 ns; a_1 <= "1000"; sel_1 <= "11";
                wait for 5 ns; a_1 <= "1001"; sel_1 <= "11";
                wait for 5 ns; a_1 <= "1010"; sel_1 <= "11";
                wait for 5 ns; a_1 <= "1011"; sel_1 <= "11";
                wait for 5 ns; a_1 <= "1100"; sel_1 <= "11";
                wait for 5 ns; a_1 <= "1101"; sel_1 <= "11";
                wait for 5 ns; a_1 <= "1110"; sel_1 <= "11";
                wait for 5 ns; a_1 <= "1111"; sel_1 <= "11";
                wait;
    end process estimulo;

end architecture tb_multiplexador4x1;

