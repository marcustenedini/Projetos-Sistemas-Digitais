library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sum_p is
  port (
    A, B : in std_logic_vector(1 downto 0);
    S    : out std_logic_vector(2 downto 0)
  );
end sum_p;
architecture behaviour of sum_p is
  component sum
    port (
      A, B, Cin : in  std_logic;
      S, Cout   : out std_logic
    );
  end component;
  signal auxiliar : std_logic := '0';
begin
    sum_c0 : sum port map(A => A(0), B => B(0), Cin => '0', S => S(0), Cout => auxiliar);
    sum_c1 : sum port map(A => A(1), B => B(1), Cin => auxiliar, S => S(1), Cout => S(2));
end behaviour;

