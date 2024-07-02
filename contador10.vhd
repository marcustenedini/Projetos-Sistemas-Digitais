library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador10 is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        enable : in STD_LOGIC;
        RCI : in STD_LOGIC;
        load : in STD_LOGIC;
        D : in STD_LOGIC_VECTOR (3 downto 0);
        Q : out STD_LOGIC_VECTOR (3 downto 0);
        RCO : out STD_LOGIC
    );
end contador10;

architecture Behavioral of contador10 is
    type state_type is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9);
    signal state, next_state : state_type;
    signal counter : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
    process(clk, reset)
    begin
        if reset = '1' then
            state <= S0;
        elsif rising_edge(clk) then
            if load = '1' then
                case D is
                    when "0000" => state <= S0;
                    when "0001" => state <= S1;
                    when "0010" => state <= S2;
                    when "0011" => state <= S3;
                    when "0100" => state <= S4;
                    when "0101" => state <= S5;
                    when "0110" => state <= S6;
                    when "0111" => state <= S7;
                    when "1000" => state <= S8;
                    when "1001" => state <= S9;
                    when others => state <= S0; 
                end case;
            else
                state <= next_state;
            end if;
        end if;
    end process;

    process(state, enable, RCI)
    begin
        case state is
            when S0 => 
                counter <= "0000";
                if enable = '0' and RCI = '0' then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;
            when S1 => 
                counter <= "0001";
                if enable = '0' and RCI = '0' then
                    next_state <= S2;
                else
                    next_state <= S1;
                end if;
            when S2 => 
                counter <= "0010";
                if enable = '0' and RCI = '0' then
                    next_state <= S3;
                else
                    next_state <= S2;
                end if;
            when S3 => 
                counter <= "0011";
                if enable = '0' and RCI = '0' then
                    next_state <= S4;
                else
                    next_state <= S3;
                end if;
            when S4 => 
                counter <= "0100";
                if enable = '0' and RCI = '0' then
                    next_state <= S5;
                else
                    next_state <= S4;
                end if;
            when S5 => 
                counter <= "0101";
                if enable = '0' and RCI = '0' then
                    next_state <= S6;
                else
                    next_state <= S5;
                end if;
            when S6 => 
                counter <= "0110";
                if enable = '0' and RCI = '0' then
                    next_state <= S7;
                else
                    next_state <= S6;
                end if;
            when S7 => 
                counter <= "0111";
                if enable = '0' and RCI = '0' then
                    next_state <= S8;
                else
                    next_state <= S7;
                end if;
            when S8 => 
                counter <= "1000";
                if enable = '0' and RCI = '0' then
                    next_state <= S9;
                else
                    next_state <= S8;
                end if;
            when S9 => 
                counter <= "1001";
                if enable = '0' and RCI = '0' then
                    next_state <= S0;
                else
                    next_state <= S9;
                end if;
            when others => 
                next_state <= S0;
        end case;
    end process;

    Q <= counter;
    RCO <= '0' when counter = "1001" else '1';
end Behavioral;
