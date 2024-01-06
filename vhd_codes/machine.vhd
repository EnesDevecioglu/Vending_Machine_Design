library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;
entity machine is
Port (
clk3,rst3,N,D : in std_logic;
candy,CR : out std_logic;
Number : out STD_LOGIC_VECTOR (5 downto 0)
);
end machine;
architecture process_23 of machine is
type state_type is (S0,S5,S10,S15,S20,S25,S30,S35,S40,S40p);
signal state, next_state: state_type;
signal countN : integer := 0;
signal countD : integer := 0;
signal total : integer;
signal bit6: STD_LOGIC_VECTOR (5 downto 0):= "000000";
begin
state_register: process (clk3, rst3)
begin
if (rst3 = '1') then
state <= S0;
elsif (clk3'event and clk3 = '1') then
state <= next_state;
end if;
end process;
X_and_next_state_functions: process (D,N,state)
begin
case state is
when S0 =>
candy <= '0';
CR <= '0';
 if (D = '0' and N = '0') or (D = '1' and N = '1') then
 next_state <= S0;
 elsif D = '0' and N = '1' then
 next_state <= S5;
 elsif D = '1' and N = '0' then
 next_state <= S10;
 end if;
when S5 =>
candy <= '0';
CR <= '0';
 if (D = '0' and N = '0') or (D = '1' and N = '1') then
 next_state <= S5;
 elsif D = '0' and N = '1' then
 next_state <= S10;
 elsif D = '1' and N = '0' then
 next_state <= S15;
 end if;
when S10 =>
candy <= '0';
CR <= '0';
 if (D = '0' and N = '0') or (D = '1' and N = '1') then
 next_state <= S10;
 elsif D = '0' and N = '1' then
 next_state <= S15;
 elsif D = '1' and N = '0' then
 next_state <= S20;
 end if;
when S15 =>
candy <= '0';
CR <= '0';
 if (D = '0' and N = '0') or (D = '1' and N = '1') then
 next_state <= S15;
 elsif D = '0' and N = '1' then
 next_state <= S20;
 elsif D = '1' and N = '0' then
 next_state <= S25;
 end if;
when S20 =>
candy <= '0';
CR <= '0';
 if (D = '0' and N = '0') or (D = '1' and N = '1') then
 next_state <= S20;
 elsif D = '0' and N = '1' then
 next_state <= S25;
 elsif D = '1' and N = '0' then
 next_state <= S30;
 end if;
when S25 =>
candy <= '0';
CR <= '0';
 if (D = '0' and N = '0') or (D = '1' and N = '1') then
 next_state <= S25;
 elsif D = '0' and N = '1' then
 next_state <= S30;
 elsif D = '1' and N = '0' then
 next_state <= S35;
 end if;

when S30 =>
candy <= '0';
CR <= '0';
 if (D = '0' and N = '0') or (D = '1' and N = '1') then
 next_state <= S30;
 elsif D = '0' and N = '1' then
 next_state <= S35;
 elsif D = '1' and N = '0' then
 next_state <= S40;
 end if;

when S35 =>
candy <= '0';
CR <= '0';
 if (D = '0' and N = '0') or (D = '1' and N = '1') then
 next_state <= S35;
 elsif D = '0' and N = '1' then
 next_state <= S40;
 elsif D = '1' and N = '0' then
 next_state <= S40p;
 end if;

when S40 =>
candy <= '1';
CR <= '0';
 if (D = '0' and N = '0') or (D = '1' and N = '1') then
 next_state <= S40;
 elsif D = '0' and N = '1' then
 next_state <= S40p;
 elsif D = '1' and N = '0' then
 next_state <= S40p;
 end if;
when S40p =>
candy <= '1';
CR <= '1';
 if (D = '0' and N = '0') or (D = '1' and N = '1') then
 next_state <= S40p;
 elsif D = '0' and N = '1' then
 next_state <= S40p;
 elsif D = '1' and N = '0' then
 next_state <= S40p;
 end if;


end case;
end process;
process (clk3)
begin
 if (clk3'event and clk3 = '1') then
 if rst3 = '1' then
 countD <= 0;
 countN <= 0;
 else
 if N = '1' then
 countN <= countN + 1;
 end if;
 if D = '1' then
 countD <= countD + 1;
 if (D = '1' and N = '1') then
 countN <= countN ;
 countD <= countD ;
 end if;
 end if;
 end if;
 end if;
end process;
total <= countD * 10 + countN * 5;
bit6 <= std_logic_vector(to_unsigned(total, bit6'length));
Number <= bit6;
end architecture;
