library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_maquina_refrigerante is
end tb_maquina_refrigerante;

architecture Behavioral of tb_maquina_refrigerante is
    signal clk         : STD_LOGIC := '0';
    signal reset       : STD_LOGIC := '0';
    signal A           : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
    signal refrigerante: STD_LOGIC;
    signal devolver_025: STD_LOGIC;
    signal devolver_050: STD_LOGIC;
    
    constant clk_period : time := 10 ns;

begin
    uut: entity work.maquina_refrigerante
        port map (
            clk => clk,
            reset => reset,
            A => A,
            refrigerante => refrigerante,
            devolver_025 => devolver_025,
            devolver_050 => devolver_050
        );

    clk_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    stimulus: process
    begin

        reset <= '1';
        wait for 10 ns;
        reset <= '0';

        -- Teste S0
        A <= "01"; wait for 10 ns;  -- S0 -> S4
        A <= "00"; wait for 10 ns;
        A <= "10"; wait for 10 ns;  -- S4 -> S6
        A <= "00"; wait for 10 ns;
        A <= "11"; wait for 10 ns;  -- S6 -> S3     
        A <= "00"; wait for 10 ns;

        reset <= '1';
        wait for 10 ns;
        reset <= '0';


        -- Teste S4
        A <= "01"; wait for 10 ns;  -- S0 -> S4
        A <= "01"; wait for 10 ns;  -- S4 -> S5
        A <= "01"; wait for 10 ns;  -- S5 -> S6
        A <= "01"; wait for 10 ns;  -- S6 -> S7
        A <= "00"; wait for 10 ns;
        A <= "01"; wait for 10 ns;  -- S0 -> S4
        A <= "10"; wait for 10 ns;  -- S4 -> S6
        A <= "10"; wait for 10 ns;  -- S6 -> S8
        A <= "00"; wait for 10 ns;  -- S8 -> S1
        A <= "11"; wait for 10 ns;  -- S1 -> S0 
        A <= "00"; wait for 10 ns;

        -- Teste S5
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
        
        A <= "01"; wait for 10 ns;  -- S0 -> S4
        A <= "01"; wait for 10 ns;  -- S4 -> S5
        A <= "10"; wait for 10 ns;  -- S5 -> S7
        A <= "00"; wait for 10 ns;
        A <= "11"; wait for 10 ns;  -- S0 -> S0

        reset <= '1';
        wait for 10 ns;
        reset <= '0';

        -- Teste S1 
        A <= "01"; wait for 10 ns;  -- S0 -> S4
        A <= "10"; wait for 10 ns;  -- S4 -> S6
        A <= "10"; wait for 10 ns;  -- S6 -> S8
        A <= "01"; wait for 10 ns;  -- S8 -> S5 
        A <= "10"; wait for 10 ns;  -- S5 -> S7
        
        reset <= '1';
        wait for 10 ns;
        reset <= '0';

        wait;
    end process;
end Behavioral;
