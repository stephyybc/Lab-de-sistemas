----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:46:03 05/04/2020 
-- Design Name: 
-- Module Name:    BCD8 - Behavioral 
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

entity BCD8 is
    Port ( D : in  bit_vector(7 downto 0);
           CLK : in  bit;
           CLR : in  bit;
           LOAD : in  bit;
           ENT : in  bit;
           ENP : in  bit;
           UP : in  bit;
           CO : out  bit;
           Q : out  unsigned(7 downto 0));
end BCD8;

architecture Behavioral of BCD8 is
component BCD 
	Port ( D : in  bit_vector(3 downto 0);
           CLK : in  bit;
           CLR : in  bit;
           LOAD : in  bit;
           ENT : in  bit;
           ENP : in  bit;
           UP : in  bit;
           CO : out  bit;
           Q : out  unsigned(3 downto 0));
end component; 
signal CO_AUX, CO_AUX2: bit;
signal AUX: bit_vector(1 downto 0); 
begin
	BCD0: BCD port map (D(3 downto 0),CLK, CLR, LOAD, ENT, ENP, UP, CO_AUX, Q(3 downto 0)); 
	BDC1: BCD port map (D(7 downto 4),CLK, CLR, LOAD, CO_AUX, ENP, UP, CO_AUX2, Q(7 downto 4)); 

AUX<=CO_AUX & CO_AUX2; 

CO<= '1' when AUX="11" and UP='1' and CLR='1' and LOAD='1' 
else '1' when AUX="11" and UP='0' and CLR='1' and LOAD='1'
else '0'; 

end Behavioral;

