----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:13:17 05/12/2020 
-- Design Name: 
-- Module Name:    UpDown4 - Behavioral 
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
use ieee.numeric_bit.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UpDown4 is
    Port ( D : in  unsigned(3 downto 0);
           CET : in  bit;
           CEP : in  bit;
           CLK : in  bit;
           PE : in  bit;
           U_D : in  bit;
           Q : out  unsigned(3 downto 0);
           TC : out  bit);
end UpDown4;

architecture Behavioral of UpDown4 is
signal Qint: unsigned(3 downto 0); 
begin
	Process(CLK)
	begin 
		if CLK='1' and CLK'event then 
			if PE ='1' then Qint<=D; 
			elsif CEP='0' and CET='0' then 
				if U_D ='1' then Qint<=Qint+1; 
				elsif U_D='0' then Qint<= Qint-1; 
				end if; 
			end if; 
		end if; 
	end process; 

TC<= '0' when Qint="1111" and PE='0' and CEP='0' and CET='0' and U_D='1'
else '0' when Qint="0000" and PE='0' and CEP='0' and CET='0' and U_D='0'
else '1'; 

Q<=Qint; 
end Behavioral;

