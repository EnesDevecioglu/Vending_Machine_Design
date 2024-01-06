library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;
entity twodigit is
Port (
Number1 : in std_logic_vector (5 downto 0);
clk4 : in std_logic;
out7 : out std_logic_vector (6 downto 0);
en_out : out std_logic_vector (3 downto 0)
);
end twodigit;
architecture Behavioral of twodigit is
component D1 is
 port (

 bit4_1 :in STD_LOGIC_VECTOR (3 downto 0);
 D1_out:out STD_LOGIC_VECTOR (6 downto 0)
 );
 end component;

component D2 is
port (
bit4_2 :in STD_LOGIC_VECTOR (3 downto 0);
D2_out:out STD_LOGIC_VECTOR (6 downto 0)
 );
 end component;
signal decimal : integer;
signal digit1: integer range 0 to 9;
signal digit2: integer range 0 to 9;
signal bit4_1 : STD_LOGIC_VECTOR (3 downto 0):="0000";
signal bit4_2: STD_LOGIC_VECTOR (3 downto 0):="0000";
signal D1_out: STD_LOGIC_VECTOR (6 downto 0);
signal D2_out: STD_LOGIC_VECTOR (6 downto 0);
--signal toggle: std_logic :='0';
begin
decimal <= to_integer(unsigned(Number1));
digit1 <= (decimal / 10);
digit2 <= (decimal rem 10);
bit4_1 <= std_logic_vector(to_unsigned(digit1, bit4_1'length));
bit4_2 <= std_logic_vector(to_unsigned(digit2, bit4_2'length));
D1_out(6) <= (bit4_1(3) and bit4_1(1)) or (bit4_1(3) and bit4_1(2)) or (not(bit4_1(1)) and
not(bit4_1(0)) and bit4_1(2)) or (not(bit4_1(3)) and not(bit4_1(2)) and not(bit4_1(1)) and
bit4_1(0));
D1_out(5) <= (bit4_1(3) and bit4_1(2)) or (bit4_1(3) and bit4_1(1)) or (not(bit4_1(1)) and
bit4_1(0) and bit4_1(2)) or (bit4_1(1) and not(bit4_1(0)) and bit4_1(2));
D1_out(4) <= (bit4_1(3) and bit4_1(2)) or (bit4_1(3) and bit4_1(1)) or (not(bit4_1(3)) and
not(bit4_1(2)) and bit4_1(1) and not(bit4_1(0)));
D1_out(3) <= (bit4_1(3) and bit4_1(2)) or (bit4_1(3) and bit4_1(1)) or (not(bit4_1(1)) and
not(bit4_1(0)) and bit4_1(2)) or (bit4_1(1) and bit4_1(0) and bit4_1(2)) or (not(bit4_1(1)) and
bit4_1(0) and not(bit4_1(3)) and not(bit4_1(2)));
D1_out(2) <= bit4_1(0) or (bit4_1(2) and not(bit4_1(1))) or (bit4_1(3) and bit4_1(1));
D1_out(1) <= (bit4_1(3) and bit4_1(2)) or (bit4_1(1) and bit4_1(0)) or (bit4_1(3) and
bit4_1(1)) or (not(bit4_1(3)) and not(bit4_1(2)) and bit4_1(0)) or (bit4_1(1) and
not(bit4_1(0)) and not(bit4_1(2)));
D1_out(0) <= (bit4_1(3) and bit4_1(2)) or (bit4_1(3) and bit4_1(1)) or (not(bit4_1(3)) and
not(bit4_1(2)) and not(bit4_1(1))) or (bit4_1(1) and bit4_1(0) and bit4_1(2));
D2_out(6) <= (bit4_2(3) and bit4_2(1)) or (bit4_2(3) and bit4_2(2)) or (not(bit4_2(1)) and
not(bit4_2(0)) and bit4_2(2)) or (not(bit4_2(3)) and not(bit4_2(2)) and not(bit4_2(1)) and
bit4_2(0));
D2_out(5) <= (bit4_2(3) and bit4_2(2)) or (bit4_2(3) and bit4_2(1)) or (not(bit4_2(1)) and
bit4_2(0) and bit4_2(2)) or (bit4_2(1) and not(bit4_2(0)) and bit4_2(2));
D2_out(4) <= (bit4_2(3) and bit4_2(2)) or (bit4_2(3) and bit4_2(1)) or (not(bit4_2(3)) and
not(bit4_2(2)) and bit4_2(1) and not(bit4_2(0)));
D2_out(3) <= (bit4_2(3) and bit4_2(2)) or (bit4_2(3) and bit4_2(1)) or (not(bit4_2(1)) and
not(bit4_2(0)) and bit4_2(2)) or (bit4_2(1) and bit4_2(0) and bit4_2(2)) or (not(bit4_2(1)) and
bit4_2(0) and not(bit4_2(3)) and not(bit4_2(2)));
D2_out(2) <= bit4_2(0) or (bit4_2(2) and not(bit4_2(1))) or (bit4_2(3) and bit4_2(1));
D2_out(1) <= (bit4_2(3) and bit4_2(2)) or (bit4_2(1) and bit4_2(0)) or (bit4_2(3) and
bit4_2(1)) or (not(bit4_2(3)) and not(bit4_2(2)) and bit4_2(0)) or (bit4_2(1) and
not(bit4_2(0)) and not(bit4_2(2)));
D2_out(0) <= (bit4_2(3) and bit4_2(2)) or (bit4_2(3) and bit4_2(1)) or (not(bit4_2(3)) and
not(bit4_2(2)) and not(bit4_2(1))) or (bit4_2(1) and bit4_2(0) and bit4_2(2));
process(clk4)
begin
 if clk4 ='1' then

 en_out(3) <= '1';
 en_out(2) <= '1';
 en_out(1) <= '0';
 en_out(0) <= '1';
 out7 <= D1_out;

 else
 en_out(3) <= '1';
 en_out(2) <= '1';
 en_out(1) <= '1';
 en_out(0) <= '0';
 out7 <= D2_out;
 end if;

end process;
end Behavioral;
