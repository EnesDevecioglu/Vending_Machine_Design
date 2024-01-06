library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity button is
Port (
clk2,bi,rst2 : in std_logic;
bo : out std_logic
);
end button;
architecture Behavioral of button is
signal D1,D2 : std_logic;
signal A,B : std_logic :='0';
begin
D1 <= bi and (A or B);
D2 <= bi and (A or not(B));
bo <= not(A) and B;
process (clk2)
 begin
 if rising_edge(clk2) then
 if rst2 = '1' then
 A <= '0';
 B <= '0';
 else
 A <= D1;
 B <= D2;
end if;
end if;
--process (clk2) ------------------------ DFF
-- begin
-- if (clk2'event and clk2 = '1') then
-- A <= D1;
-- B <= D2;

end process;
end Behavioral;
