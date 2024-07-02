library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity exp402_tb is
end exp402_tb;


architecture tb_archi of exp402_tb is

    component exp402 is
        port (
            a:std_logic_vector(7 downto 0);
            x,y : out std_logic
        );
    end component;
    component multiplexador8x1 is
        port (
            D: in std_logic_vector(7 downto 0);
            S: in std_logic_vector(2 downto 0);
            X: out std_logic
        );
    end component;

    component decodificador4x16 is
        port (
            A : in std_logic_vector(3 downto 0);
            Y : out std_logic_vector(15 downto 0)
        );
    end component;

    signal a_tb : std_logic_vector(7 downto 0);
    signal x_tb,y_tb : std_logic;
    signal D_tx_tb: std_logic_vector(7 downto 0);
    signal S_tx_tb: std_logic_vector(2 downto 0);
    signal X_tx_tb: std_logic;
    signal A_tx_tb: std_logic_vector(3 downto 0);
    signal Y_tx_tb: std_logic_vector(15 downto 0);
    begin
        UUT : exp402
        port map (
            a => a_tb
        );
        MUX8x1: multiplexador8x1 port map(
            D => D_tx_tb,
            S => S_tx_tb,
            X => X_tx_tb
        );
        Decodificador: decodificador4x16 port map(
            A => A_tx_tb,
            Y => Y_tx_tb
        );
    
    estimulo:process
        begin
            for i in 0 to 255 loop
                a_tb <= std_logic_vector(to_unsigned(i,8));
                wait for 10 ns; 
            end loop;
            wait;
        end process;
end tb_archi;

            