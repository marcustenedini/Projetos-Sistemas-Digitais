library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity timeflags is
    Port (
        tens : in STD_LOGIC_VECTOR(3 downto 0);
        unit : in STD_LOGIC_VECTOR(3 downto 0);
        T5 : out STD_LOGIC;
        T6 : out STD_LOGIC;
        T20 : out STD_LOGIC;
        T60 : out STD_LOGIC
    );
end timeflags;

architecture Behavioral of timeflags is
begin
    T5 <= '1' when (tens & unit) = "0101" else '0';
    T6 <= '1' when (tens & unit) = "0110" else '0';
    T20 <= '1' when (tens & unit) = "00100000" else '0';
    T60 <= '1' when (tens & unit) = "01111001" else '0';
end Behavioral;
