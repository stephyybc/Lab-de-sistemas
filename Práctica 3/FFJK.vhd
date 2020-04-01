----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:32:46 03/31/2020 
-- Design Name: 
-- Module Name:    FFJK - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FFJK is
    Port ( CLK : in  bit;
           J : in  bit;
           K : in  bit;
           CLR : in  bit;
           SET : in  bit;
           Q : out  bit);
end FFJK;

architecture Behavioral of FFJK is
signal qestado: bit;
begin
process (clk,SET,clr) 
begin
	if SET = '1' then Q <= '1';
		elsif CLR = '1' then Q <= '0';
		elsif CLK = '0' and CLK'EVENT then
			if J = '1' and K = '1' then qestado <= NOT qestado;
			elsif J = '1' and K = '0' then qestado <= '1';
			elsif J = '0' and K = '1' then qestado <= '0';
			elsif J = '0' and K = '0' then qestado <= qestado;
		end if;
	end if;
end process;
Q <= qestado;

end Behavioral;

