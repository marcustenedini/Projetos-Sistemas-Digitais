library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_JK_FF is
end TB_JK_FF;

architecture Behavioral of TB_JK_FF is
    signal PR   : STD_LOGIC := '0';
    signal CLR  : STD_LOGIC := '0';
    signal CLK  : STD_LOGIC := '0';
    signal J    : STD_LOGIC := '0';
    signal K    : STD_LOGIC := '0';
    signal Q    : STD_LOGIC;

    component JK_FF
        Port (
            PR   : in  STD_LOGIC;
            CLR  : in  STD_LOGIC;
            CLK  : in  STD_LOGIC;
            J    : in  STD_LOGIC;
            K    : in  STD_LOGIC;
            Q    : out STD_LOGIC
        );
    end component;

begin
    UUT: JK_FF PORT MAP (
        PR => PR,
        CLR => CLR,
        CLK => CLK,
        J => J,
        K => K,
        Q => Q
    );

    CLK_process :process
    begin
        CLK <= '0';
        wait for 10 ns;
        CLK <= '1';
        wait for 10 ns;
    end process;


    stim_proc: process
    begin

        PR <= '1'; wait for 20 ns;
        PR <= '0'; wait for 20 ns;
        CLR <= '1'; wait for 20 ns;
        CLR <= '0'; wait for 20 ns;
        
        J <= '0'; K <= '0'; wait for 20 ns;
        J <= '0'; K <= '1'; wait for 20 ns;
        J <= '1'; K <= '0'; wait for 20 ns;
        J <= '1'; K <= '1'; wait for 20 ns;
        

        wait;
    end process;
end Behavioral;
