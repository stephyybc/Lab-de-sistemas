----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:50:00 03/22/2020 
-- Design Name: 
-- Module Name:    Multiplexer - Behavioral 
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

entity Multiplexer is
    Port ( A : in  bit;
           B : in  bit;
           C : in  bit;
           D : in  bit;
           S0 : in  bit;
           S1 : in  bit;
           Z : out  bit);
end Multiplexer;

architecture Behavioral of Multiplexer is
begin
process (A,B,C,D,S0,S1) is 
begin 
	if (S0='0' and S1='0') then 
		Z <= A;
	elsif (S0='1' and S1='0') then 
		Z <= B;
	elsif (S0='0' and S1='1') then 
		Z <= C;
	else 
		Z <= D; 
	end if; 
end process; 

end Behavioral;

