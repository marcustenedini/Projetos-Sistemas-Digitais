entity testbench2 is
end entity testbench2;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

architecture tb_somadorcompleto of testbench2 is
    component somadorcompleto -- Corrigido: Faltou o "is" nesta linha
        port (
            a, b, cin : in std_logic;
            cout, s : out std_logic
        );
    end component;

    signal a_1, b_1, cin_1 : std_logic;
    signal cout_1, s_1 : std_logic; -- Adicionado sinais para capturar os resultados
begin
    somador_inst : somadorcompleto  -- Corrigido: Nome da instância
        port map (
            a => a_1,
            b => b_1,
            cin => cin_1,
            cout => cout_1,  -- Corrigido: Nome do sinal cout
            s => s_1        -- Corrigido: Nome do sinal s
        );

    estimulo : process 
    begin
        wait for 5 ns; a_1 <= '0'; b_1 <= '0'; cin_1 <= '0';
        wait for 5 ns; a_1 <= '0'; b_1 <= '0'; cin_1 <= '1';
        wait for 5 ns; a_1 <= '0'; b_1 <= '1'; cin_1 <= '0';
        wait for 5 ns; a_1 <= '0'; b_1 <= '1'; cin_1 <= '1';
        wait for 5 ns; a_1 <= '1'; b_1 <= '0'; cin_1 <= '0';
        wait for 5 ns; a_1 <= '1'; b_1 <= '0'; cin_1 <= '1';
        wait for 5 ns; a_1 <= '1'; b_1 <= '1'; cin_1 <= '0';
        wait for 5 ns; a_1 <= '1'; b_1 <= '1'; cin_1 <= '1';
        wait;  -- Adicionado para manter a simulação em execução
    end process estimulo;
end architecture tb_somadorcompleto;

