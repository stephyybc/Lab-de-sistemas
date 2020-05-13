----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:06:52 05/04/2020 
-- Design Name: 
-- Module Name:    BCD - Behavioral 
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
use IEEE.numeric_bit.all; 

entity BCD is
    Port ( D : in  bit_vector(3 downto 0);
           CLK : in  bit;
           CLR : in  bit;
           LOAD : in  bit;
           ENT : in  bit;
           ENP : in  bit;
           UP : in  bit;
           CO : out  bit;
           Q : out  unsigned(3 downto 0));
end BCD;

architecture Behavioral of BCD is
signal Qint: unsigned(3 downto 0); 
begin
	process(CLR, CLK) 
	begin 
		if CLR='0' then Qint<="0000"; 
		elsif CLK='1' and CLK'event then 
			if LOAD='0' then Qint<=UNSIGNED(D); 
			elsif ENT='1' and ENP='1' and UP='1' then 
				Qint<= Qint+1; 
				if Qint="1001" then 
				Qint<="0000";  
				end if; 
			elsif ENT='1' and ENP='1' and UP='0' then
				Qint<= Qint -1; 
				if Qint = "0000" then 
				Qint<="1001";  
				end if; 
			end if; 
		end if; 
	end process; 
	
CO<= '1' when Qint="1001" and UP='1' and CLR='1' and LOAD='1' 
else '1' when Qint="0000" and UP='0' and CLR='1' and LOAD='1'
else '0'; 
Q<=Qint; 
end Behavioral;
