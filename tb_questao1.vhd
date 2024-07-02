library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity exp401_tb is
end exp401_tb;

architecture tb_arch of exp401_tb is

    -- Componente a ser testado
    component exp401 is
        port (
            a, b, c : in std_logic;
            x, y : out std_logic
        );
    end component;

    -- Signals for inputs and outputs of exp401
    signal a_tb, b_tb, c_tb : std_logic;
    signal x_tb, y_tb : std_logic;

    -- Componente a ser instanciado dentro da exp401
    component multiplexador is
        port (
            D: in std_logic_vector(3 downto 0);
            S: in std_logic_vector(1 downto 0);
            Y: out std_logic
        );
    end component;

    -- Signals for inputs and outputs of multiplexadores
    signal D_tx_tb, D_ty_tb : std_logic_vector(3 downto 0);
    signal S_tx_tb : std_logic_vector(1 downto 0);
    signal Y_tx_tb, Y_ty_tb : std_logic;

begin

    -- Instância da entidade exp401
    dut : exp401 port map (
        a => a_tb,
        b => b_tb,
        c => c_tb,
        x => x_tb,
        y => y_tb
    );

    -- Instâncias dos multiplexadores
    Tx : multiplexador port map (
        D => D_tx_tb,
        S => S_tx_tb,
        Y => Y_tx_tb
    );

    Ty : multiplexador port map (
        D => D_ty_tb,
        S => S_tx_tb,  -- Aqui estamos reutilizando o mesmo sinal de seleção S_tx_tb para ambas as instâncias
        Y => Y_ty_tb
    );

    -- Processo de estímulo
    stim_proc: process
    begin
        -- Estímulo inicial
        a_tb <= '0';
        b_tb <= '0';
        c_tb <= '0';
        wait for 10 ns;

        a_tb <= '0';
        b_tb <= '0';
        c_tb <= '1';
        wait for 10 ns;

        a_tb <= '0';
        b_tb <= '1';
        c_tb <= '0';
        wait for 10 ns;

        a_tb <= '0';
        b_tb <= '1';
        c_tb <= '1';
        wait for 10 ns;

        a_tb <= '1';
        b_tb <= '0';
        c_tb <= '0';
        wait for 10 ns;

        a_tb <= '1';
        b_tb <= '0';
        c_tb <= '1';
        wait for 10 ns;

        a_tb <= '1';
        b_tb <= '1';
        c_tb <= '0';
        wait for 10 ns;

        a_tb <= '1';
        b_tb <= '1';
        c_tb <= '1';
        wait for 10 ns;

        -- Fim do teste
        wait;
    end process stim_proc;


end tb_arch;
