library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity contador100 is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        enable : in STD_LOGIC;
        load : in STD_LOGIC;
        D : in STD_LOGIC_VECTOR (7 downto 0);
        Q : out STD_LOGIC_VECTOR (7 downto 0);
        RCO : out STD_LOGIC
    );
end contador100;

architecture Behavioral of contador100 is
    signal Q_units : STD_LOGIC_VECTOR (3 downto 0);
    signal Q_tens : STD_LOGIC_VECTOR (3 downto 0);
    signal RCO_units : STD_LOGIC;
    signal RCI_tens : STD_LOGIC := '0';

    component contador10 is
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
    end component;
    
begin
   
    units_counter: contador10
        port map (
            clk => clk,
            reset => reset,
            enable => enable,
            RCI => '0',
            load => load,
            D => D(3 downto 0),
            Q => Q_units,
            RCO => RCO_units
        );
    

    tens_counter: contador10
        port map (
            clk => clk,
            reset => reset,
            enable => enable,
            RCI => RCO_units, -
            load => load,
            D => D(7 downto 4),
            Q => Q_tens,
            RCO => RCO
        );
    Q <= Q_tens & Q_units;
    
end Behavioral;
