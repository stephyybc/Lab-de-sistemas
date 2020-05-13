----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:40:33 05/04/2020 
-- Design Name: 
-- Module Name:    Code - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Code is
    Port ( CLK : in  bit;
           CLR : in  bit;
           SDL : in  bit;
           SDR : in  bit;
           S : in  bit_vector(1 downto 0) ;
           D : in  bit_Vector (3 downto 0);
           Q : out  bit_vector (3 downto 0));
end Code;

architecture Behavioral of Code is

begin
	process (CLK, CLR)
	begin 
		if ClR = '0' then Q<= "0000"; 
		elsif CLK = '1' and CLK'event then 
			if S = "11" then Q<=D; 
			elsif S = "10" then Q<= SDR & D(3 downto 1); 
			elsif S = "01" then Q<= D(2 downto 0) & SDL; 
			end if; 
		end if; 
	end process; 

end Behavioral;

