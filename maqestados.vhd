library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity maqestados is
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
end maqestados;

architecture Behavioral of maqestados is
    type state_type is (NS_GREEN, NS_YELLOW, ALL_RED, EW_GREEN, EW_YELLOW, BLINKING);
    signal currentState, nextState : state_type;


    signal semaforoA_sig, semaforoB_sig : STD_LOGIC_VECTOR(2 downto 0);

begin

    process(clk, reset)
    begin
        if reset = '1' then
            currentState <= NS_GREEN;
        elsif rising_edge(clk) then
            currentState <= nextState;
        end if;
    end process;

    process(currentState, ligadesliga, sensorA, sensorB, T5, T6, T20, T60)
    begin
        case currentState is
            when NS_GREEN =>
                semaforoA_sig <= "010"; -- Green
                semaforoB_sig <= "100"; -- Red
                if T60 = '1' or (T20 = '1' and sensorB = '1' and sensorA = '0') then
                    nextState <= NS_YELLOW;
                else
                    nextState <= NS_GREEN;
                end if;

            when NS_YELLOW =>
                semaforoA_sig <= "001"; -- Yellow
                semaforoB_sig <= "100"; -- Red
                if T6 = '1' then
                    nextState <= ALL_RED;
                else
                    nextState <= NS_YELLOW;
                end if;

            when ALL_RED =>
                semaforoA_sig <= "100"; -- Red
                semaforoB_sig <= "100"; -- Red
                if T5 = '1' then
                    if currentState = EW_GREEN or currentState = EW_YELLOW then
                        nextState <= NS_GREEN;
                    else
                        nextState <= EW_GREEN;
                    end if;
                else
                    nextState <= ALL_RED;
                end if;

            when EW_GREEN =>
                semaforoA_sig <= "100"; -- Red
                semaforoB_sig <= "010"; -- Green
                if T60 = '1' or (T20 = '1' and sensorA = '1' and sensorB = '0') then
                    nextState <= EW_YELLOW;
                else
                    nextState <= EW_GREEN;
                end if;

            when EW_YELLOW =>
                semaforoA_sig <= "100"; -- Red
                semaforoB_sig <= "001"; -- Yellow
                if T6 = '1' then
                    nextState <= ALL_RED;
                else
                    nextState <= EW_YELLOW;
                end if;
            when others =>
                nextState <= NS_GREEN;
        end case;
    end process;

    -- Output assignments
    semaforoA <= semaforoA_sig;
    semaforoB <= semaforoB_sig;
    resetcounter <= '1' when nextState /= currentState else '0';

    -- Blinking process
    process(clk, reset)
    begin
        if reset = '1' then
            blink <= '0';
            blink_counter <= 0;
        elsif rising_edge(clk) then
            if currentState = BLINKING then
                if blink_counter = 10000000 then -- 1 second assuming 10ns clock period
                    blink <= not blink;
                    blink_counter <= 0;
                else
                    blink_counter <= blink_counter + 1;
                end if;
            else
                blink <= '0';
                blink_counter <= 0;
            end if;
        end if;
    end process;
end Behavioral;
