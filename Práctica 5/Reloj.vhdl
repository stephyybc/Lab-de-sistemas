----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:59:20 05/11/2020 
-- Design Name: 
-- Module Name:    Reloj - Behavioral 
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

entity Reloj is
    Port ( CLK  : in  bit;
           QM : out  integer range 0 to 59;
           QH : out  integer range 0 to 11);
end Reloj;

architecture Behavioral of Reloj is
signal QM2: unsigned (5 downto 0); 
signal QH2: unsigned (3 downto 0); 
begin
	Process (CLK)
	begin
		if CLK='1' and CLK'event then 
			QM2<= QM2 + 1; 
			if QM2= "111011" then 
				QH2<= QH2 + 1; 
				QM2<="000000"; 
				if QH2="0000" then 
				QH2<="0001";
				end if; 
			end if; 
		end if; 
	end process; 
	
QM<= TO_integer(QM2); 
QH<= TO_Integer(QH2); 

end Behavioral;

