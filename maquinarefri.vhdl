library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity maquina_refrigerante is
    Port (
        clk     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        A       : in  STD_LOGIC_VECTOR(1 downto 0);
        refrigerante : out STD_LOGIC;
        devolver_025 : out STD_LOGIC;
        devolver_050 : out STD_LOGIC
    );
end maquina_refrigerante;
architecture Behavioral of maquina_refrigerante is
    type state_type is (S0, S1, S2, S3, S4, S5, S6, S7, S8);
    signal state, next_state : state_type;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            state <= S0;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;

    process(state, A)
    begin
        next_state <= state;
        refrigerante <= '0';
        devolver_025 <= '0';
        devolver_050 <= '0';
        
        case state is
            when S0 =>
                if A = "01" then
                    next_state <= S4;
                elsif A = "10" then
                    next_state <= S5;
                elsif A = "11" then
                    next_state <= S0;
                else
                    next_state <= S0;
                end if;
            when S1 =>
                devolver_025 <= '1';
                if A = "01" then
                    next_state <= S4;
                elsif A = "10" then
                    next_state <= S5;
                elsif A = "11" then
                    next_state <= S0;
                else
                    next_state <= S0;
                end if;
            when S2 =>
                devolver_050 <= '1';
                if A = "01" then
                    next_state <= S4;
                elsif A = "10" then
                    next_state <= S5;
                elsif A = "11" then
                    next_state <= S0;
                else
                    next_state <= S0;
                end if;
            when S3 =>
                devolver_025 <= '1';
                devolver_050 <= '1';
                if A = "01" then
                    next_state <= S4;
                elsif A = "10" then
                    next_state <= S5;
                elsif A = "11" then
                    next_state <= S0;
                else
                    next_state <= S0;
                end if;
            when S4 =>
                if A = "01" then
                    next_state <= S5;
                elsif A = "10" then
                    next_state <= S6;
                elsif A = "11" then
                    next_state <= S1;
                else
                    next_state <= S4;
                end if;
            when S5 =>
                if A = "01" then
                    next_state <= S6;
                elsif A = "10" then
                    next_state <= S7;
                elsif A = "11" then
                    next_state <= S2;
                else
                    next_state <= S5;
                end if;
            when S6 =>
                if A = "01" then
                    next_state <= S7;
                elsif A = "10" then
                    next_state <= S8;
                elsif A = "11" then
                    next_state <= S3;
                else
                    next_state <= S6;
                end if;
            when S7 =>
                refrigerante <= '1';
                if A = "01" then
                    next_state <= S4;
                elsif A = "10" then
                    next_state <= S5;
                elsif A = "11" then
                    next_state <= S0;
                else
                    next_state <= S0;
                end if;
            when S8 =>
                refrigerante <= '1';
                if A = "01" then
                    next_state <= S5;
                elsif A = "10" then
                    next_state <= S6;
                elsif A = "11" then
                    next_state <= S1;
                else
                    next_state <= S1;
                end if;
            when others =>
                next_state <= S0;
        end case;
    end process;
end Behavioral;
