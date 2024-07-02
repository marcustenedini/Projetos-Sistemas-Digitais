library ieee;
use ieee.std_logic_1164.all;

entity exp402 is
    port (
        a: in std_logic_vector(7 downto 0);
        x, y : out std_logic
    );
end exp402;

architecture arch of exp402 is
    component multiplexador8x1 is
        port (
            D: in std_logic_vector(7 downto 0);
            S: in std_logic_vector(2 downto 0);
            Y: out std_logic
        );
    end component;

    component decodificador4x16 is
        port (
            A : in std_logic_vector(3 downto 0);
            Y : out std_logic_vector(15 downto 0)
        );
    end component;
    
    signal D_tx: std_logic_vector(7 downto 0);
    signal S_tx  : std_logic_vector(2 downto 0);
    signal X_tx: std_logic;
    signal A_tx: std_logic_vector(3 downto 0);
    signal Y_tx: std_logic_vector(15 downto 0);

    begin
        Mux: multiplexador8x1 port map (
            D=>D_tx,
            S=>S_tx,
            Y=>X_tx);

        Decodificador: decodificador4x16 port map (
            A=>A_tx,
            Y=>Y_tx);
        A_tx <= a(0) & a(1) & a(2) & a(3);
        D_tx(0) <= '0';
        D_tx(1) <= Y_tx(0)or Y_tx(15);
        D_tx(2) <= Y_tx(7);
        D_tx(3) <= '1';
        D_tx(4) <= Y_tx(15)or Y_tx(9);
        D_tx(5) <= '0';
        D_tx(6) <= Y_tx(11)or Y_tx(10);
        D_tx(7) <= '1';
        S_tx <= a(5) & a(6) & a(7);
    end arch;

