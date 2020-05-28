----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:44:51 05/27/2020 
-- Design Name: 
-- Module Name:    Counter0_99 - Behavioral 
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

entity Counter0_99 is
    Port ( D : in  unsigned (6 downto 0);
           LOAD : in  bit;
			  UP: in bit; 
           CLK : in  bit;
           CLR : in  bit;
           Q : out  unsigned (6 downto 0));
end Counter0_99;

architecture Behavioral of Counter0_99 is
signal Qint: unsigned (6 downto 0); 
begin
	process (CLK) 
	begin 
		if CLK='1' and CLK'event then 
			if CLR='0' then Qint<= "0000000"; 
			elsif LOAD='1' then Qint<=D; 
			elsif UP='1' then  
				Qint<= Qint + 1; 
				if Qint="1100011" then Qint<= "0000000"; 
				end if; 
			elsif UP='0' then 
				Qint<= Qint -1; 
				if Qint="0000000" then Qint<= "1100011"; 
				end if; 
			end if; 
		end if; 
	end process; 

Q<= Qint; 
end Behavioral;

