library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity TB_ShiftRegister is
end TB_ShiftRegister;
architecture Behavioral of TB_ShiftRegister is
    signal CLK  : STD_LOGIC := '0';
    signal RST  : STD_LOGIC := '0';
    signal LOAD : STD_LOGIC := '0';
    signal D    : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal DIR  : STD_LOGIC := '0';
    signal L    : STD_LOGIC := '0';
    signal R    : STD_LOGIC := '0';
    signal Q    : STD_LOGIC_VECTOR (3 downto 0);
    component ShiftRegister
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
    end component;
begin
    UUT: ShiftRegister PORT MAP (
        CLK => CLK,
        RST => RST,
        LOAD => LOAD,
        D => D,
        DIR => DIR,
        L => L,
        R => R,
        Q => Q
    );

    CLK_process :process
    begin
        while True loop
            CLK <= '0';
            wait for 10 ns;
            CLK <= '1';
            wait for 10 ns;
        end loop;
    end process;


    stim_proc: process
    begin
  
        RST <= '1';
        wait for 20 ns;
        RST <= '0';
        wait for 20 ns;

        LOAD <= '1';
        D <= "1010";
        wait for 20 ns;
        LOAD <= '0';
        wait for 20 ns;

        DIR <= '0';
        L <= '0';
        R <= '1';
        wait for 40 ns;

        DIR <= '0';
        L <= '1';
        R <= '0';
        wait for 40 ns;

        DIR <= '1';
        L <= '0';
        R <= '0';
        wait for 40 ns;

        DIR <= '1';
        L <= '1';
        R <= '1';
        wait for 40 ns;

        RST <= '1';
        wait for 20 ns;
        RST <= '0';
        wait for 20 ns;

        wait;
    end process;
end Behavioral;
