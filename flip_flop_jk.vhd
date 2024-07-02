library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity JK_FF is
    Port (
        PR   : in  STD_LOGIC;
        CLR  : in  STD_LOGIC;
        CLK  : in  STD_LOGIC;
        J    : in  STD_LOGIC;
        K    : in  STD_LOGIC;
        Q    : out STD_LOGIC
    );
end JK_FF;

architecture Behavioral of JK_FF is
    signal Q_int : STD_LOGIC := '0'; 
begin
    process (PR, CLR, CLK)
    begin
        if (PR = '1') then
            Q_int <= '1';
        elsif (CLR = '1') then
            Q_int <= '0';
        elsif (rising_edge(CLK)) then
            if (J = '0' and K = '0') then
                -- Q_int mantém seu valor
            elsif (J = '0' and K = '1') then
                Q_int <= '0';
            elsif (J = '1' and K = '0') then
                Q_int <= '1';
            elsif (J = '1' and K = '1') then
                Q_int <= not Q_int;
            end if;
        end if;
    end process;
    
    Q <= Q_int;
end Behavioral;
