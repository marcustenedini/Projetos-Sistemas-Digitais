library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ShiftRegister is
    Port (
        CLK  : in  STD_LOGIC;
        RST  : in  STD_LOGIC;
        LOAD : in  STD_LOGIC;
        D    : in  STD_LOGIC_VECTOR (3 downto 0);
        DIR  : in  STD_LOGIC;
        L    : in  STD_LOGIC;
        R    : in  STD_LOGIC;
        Q    : out STD_LOGIC_VECTOR (3 downto 0)
    );
end ShiftRegister;

architecture Behavioral of ShiftRegister is
    signal Q_int : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
    process (CLK, RST)
    begin
        if (RST = '1') then
            Q_int <= "0000";
        elsif (rising_edge(CLK)) then
            if (LOAD = '1') then
                Q_int <= D;
            elsif (DIR = '0') then
                if (L = '0') then
                    Q_int <= Q_int(2 downto 0) & '0';
                elsif (L = '1') then
                    Q_int <= Q_int(2 downto 0) & '1';
                end if;
            elsif (DIR = '1') then
                if (R = '0') then
                    Q_int <= '0' & Q_int(3 downto 1);
                elsif (R = '1') then
                    Q_int <= '1' & Q_int(3 downto 1);
                end if;
            end if;
        end if;
    end process;

    Q <= Q_int;
end Behavioral;
