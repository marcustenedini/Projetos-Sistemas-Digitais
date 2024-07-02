library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity semaforo_timer is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        T5 : out STD_LOGIC;
        T6 : out STD_LOGIC;
        T20 : out STD_LOGIC;
        T60 : out STD_LOGIC
    );
end semaforo_timer;

architecture Behavioral of semaforo_timer is
    signal counter : INTEGER := 0;
    signal bcd_tens : STD_LOGIC_VECTOR(3 downto 0);
    signal bcd_units : STD_LOGIC_VECTOR(3 downto 0);
begin
    process(clk, reset)
    begin
        if reset = '1' then
            counter <= 0;
        elsif rising_edge(clk) then
            counter <= counter + 1;
            if counter = 59 then
                counter <= 0;
            end if;
        end if;
    end process;

    bcd_tens <= conv_std_logic_vector(counter / 10, 4);
    bcd_units <= conv_std_logic_vector(counter mod 10, 4);

    timeflags_inst: entity work.timeflags
        port map (
            tens => bcd_tens,
            unit => bcd_units,
            T5 => T5,
            T6 => T6,
            T20 => T20,
            T60 => T60
        );
end Behavioral;
