library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity ClkDiv is
Port (
clk, rst1 : in std_logic;
clk_out : out std_logic
);
end ClkDiv;
architecture Behavioral of ClkDiv is
signal count : integer:=0;
signal hz100 : std_logic :='0';
begin
process(clk) -------------------- divider
begin
if((rising_edge(clk))) then
if(rst1 = '1') then
clk_out <= '0';
else
count <=count+1;
if(count = 500000-1) then
hz100 <= not hz100;
count <=0;
end if;
end if;
end if;
clk_out <= hz100; -- clk_out sinyali hz100'ye atandı.
end process;
end Behavioral;

