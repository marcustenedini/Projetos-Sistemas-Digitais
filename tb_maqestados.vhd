-- File: maqestados_tb.vhd

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity maqestados_tb is
end maqestados_tb;

architecture Behavioral of maqestados_tb is
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal ligadesliga : STD_LOGIC := '0';
    signal sensorA : STD_LOGIC := '0';
    signal sensorB : STD_LOGIC := '0';
    signal T5 : STD_LOGIC;
    signal T6 : STD_LOGIC;
    signal T20 : STD_LOGIC;
    signal T60 : STD_LOGIC;
    signal semaforoA : STD_LOGIC_VECTOR(2 downto 0);
    signal semaforoB : STD_LOGIC_VECTOR(2 downto 0);
    signal resetcounter : STD_LOGIC;
    signal D_counters : STD_LOGIC_VECTOR(7 downto 0);
    signal Q_counters : STD_LOGIC_VECTOR(7 downto 0);
    signal RCO_counters : STD_LOGIC;
    signal contador_reset : STD_LOGIC;

    component maqestados
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            ligadesliga : in STD_LOGIC;
            sensorA : in STD_LOGIC;
            sensorB : in STD_LOGIC;
            T5 : in STD_LOGIC;
            T6 : in STD_LOGIC;
            T20 : in STD_LOGIC;
            T60 : in STD_LOGIC;
            semaforoA : out STD_LOGIC_VECTOR (2 downto 0);
            semaforoB : out STD_LOGIC_VECTOR (2 downto 0);
            resetcounter : out STD_LOGIC
        );
    end component;

    component semaforo_timer is
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            T5 : out STD_LOGIC;
            T6 : out STD_LOGIC;
            T20 : out STD_LOGIC;
            T60 : out STD_LOGIC
        );
    end component;

begin
    uut: maqestados
        Port map (
            clk => clk,
            reset => reset,
            ligadesliga => ligadesliga,
            sensorA => sensorA,
            sensorB => sensorB,
            T5 => T5,
            T6 => T6,
            T20 => T20,
            T60 => T60,
            semaforoA => semaforoA,
            semaforoB => semaforoB,
            resetcounter => resetcounter
        );
    semaforo_timers: semaforo_timer
        Port map (
            clk => clk,
            reset => reset,
            T5 => T5,
            T6 => T6,
            T20 => T20,
            T60 => T60
        );
    contador_reset <= reset or resetcounter;
    clk_process :process
    begin
        while true loop
            clk <= '0';
            wait for 10 ns;
            clk <= '1';
            wait for 10 ns;
        end loop;
    end process clk_process;
    stim_proc: process
    begin
        reset <= '1';
        ligadesliga <= '0';
        sensorA <= '0';
        sensorB <= '0';
        wait for 20 ns;
        reset <= '0';
        wait for 20 ns;
        ligadesliga <= '1';
        wait for 20 ns;
        sensorA <= '1';
        sensorB <= '1';
        wait for 60 ns;
        sensorB <= '0';
        wait for 60 ns;
        wait for 1000 ns;
        ligadesliga <= '0';
        wait for 100 ns;
        ligadesliga <= '1';
        wait for 20 ns;
        wait;
    end process;
end Behavioral;
