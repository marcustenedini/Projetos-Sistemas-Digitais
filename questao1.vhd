library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity exp401 is
    port (
        a, b, c : in std_logic;
        x, y : out std_logic
    );
end exp401;

architecture arch of exp401 is
    component multiplexador is
        port (
            D: in std_logic_vector(3 downto 0);
            S: in std_logic_vector(1 downto 0);
            Y: out std_logic
        );
    end component;

    signal D_tx, D_ty : std_logic_vector(3 downto 0);
    signal S_tx  : std_logic_vector(1 downto 0);
    signal Y_tx, Y_ty : std_logic;
begin
    -- Instanciando o multiplexador Tx
    Tx: multiplexador port map (
        D => D_tx,
        S => S_tx,
        Y => Y_tx
    );
    -- Instanciando o multiplexador Ty
    Ty: multiplexador port map (
        D => D_ty,
        S => S_tx,
        Y => Y_ty
    );
    D_tx<= '1'& not c & c & '0';
    D_ty<= c& '0' & not c & '1';
    S_tx<= a & b;
    
end arch;
