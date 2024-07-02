library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_contador100 is

end tb_contador100;

architecture Behavioral of tb_contador100 is
   
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal enable : STD_LOGIC := '0';
    signal load : STD_LOGIC := '0';
    signal D : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal Q : STD_LOGIC_VECTOR(7 downto 0);
    signal RCO : STD_LOGIC;
    

    constant clk_period : time := 10 ns;
    
begin

    uut: entity work.contador100
        port map (
            clk => clk,
            reset => reset,
            enable => enable,
            load => load,
            D => D,
            Q => Q,
            RCO => RCO
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
        enable <= '0';
        load <= '0';
        D <= (others => '0');
        wait for 20 ns;
        reset <= '1';
        wait for clk_period;
        reset <= '0';
        wait for clk_period;
        enable <= '0';
        wait for 100 ns;
        enable <= '1';
        wait for 40 ns;
        enable <= '0';
        wait for 60 ns;
        load <= '1';
        D <= "00000101"; 
        wait for clk_period;
        load <= '0';
        wait for 40 ns;
        load <= '1';
        D <= "00010010"; 
        wait for clk_period;
        load <= '0';
        wait for 100 ns;
        wait;
    end process;
end Behavioral;
