library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somador_palavras_4bits is
    Port (
        A, B : in  std_logic_vector(3 downto 0);
        S    : out std_logic_vector(4 downto 0)
    );
end somador_palavras_4bits;

architecture Behavioral of somador_palavras_4bits is
    component somadorcompleto is
        Port (
            a, b, cin : in  std_logic;
            cout, s    : out std_logic
        );
    end component;

    signal C : std_logic_vector(3 downto 0);
begin
    -- Instanciando os somadores completos
    U0: somadorcompleto port map(A(0), B(0), '0', C(0), S(0));
    U1: somadorcompleto port map(A(1), B(1), C(0), C(1), S(1));
    U2: somadorcompleto port map(A(2), B(2), C(1), C(2), S(2));
    U3: somadorcompleto port map(A(3), B(3), C(2), C(3), S(3));

    -- Geração do carry-out extra
    S(4) <= C(3);
end Behavioral;
