library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_semaforo_timer is
end tb_semaforo_timer;

architecture Behavioral of tb_semaforo_timer is
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal T5 : STD_LOGIC;
    signal T6 : STD_LOGIC;
    signal T20 : STD_LOGIC;
    signal T60 : STD_LOGIC;
    
    constant clk_period : time := 1 ns; 
begin
    
    uut: entity work.semaforo_timer
        port map (
            clk => clk,
            reset => reset,
            T5 => T5,
            T6 => T6,
            T20 => T20,
            T60 => T60
        );
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;
    stim_proc: process
    begin
        reset <= '0';
        wait for 20 ns;
        reset <= '1';
        wait for clk_period;
        reset <= '0';
        wait for 650 ns;
        wait;
    end process;
end Behavioral;
