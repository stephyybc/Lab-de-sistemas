----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:05:30 03/31/2020 
-- Design Name: 
-- Module Name:    BCDto7 - Behavioral 
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

entity BCDto7 is
    Port ( Ai : in  bit_vector (3 downto 0);
           A : out  bit;
           B : out  bit;
           C : out  bit;
           D : out  bit;
           E : out  bit;
           F : out  bit;
           G : out  bit);
end BCDto7;

architecture Behavioral of BCDto7 is

begin
	A <= Ai(0) OR Ai(2) OR (Ai(1) AND Ai(3)) OR (NOT Ai(1) AND NOT Ai(3));
	B <= (NOT Ai(1)) OR (NOT Ai(2) AND NOT Ai(3)) OR (Ai(2) AND Ai(3));
	C <= Ai(1) OR NOT Ai(2) OR Ai(3);
	D <= (NOT Ai(1) AND NOT Ai(3)) OR (Ai(2) AND NOT Ai(3)) OR (Ai(1) AND NOT Ai(2) AND Ai(3)) OR (NOT Ai(1) AND Ai(2)) OR Ai(0);
	E <= (NOT Ai(1) AND NOT Ai(3)) OR (Ai(2) AND NOT Ai(3));
	F <= Ai(0) OR (NOT Ai(2) AND NOT Ai(3)) OR (Ai(1) AND NOT Ai(2)) OR (Ai(1) AND NOT Ai(3));
	G <= Ai(0) OR (Ai(1) AND NOT Ai(2)) OR ( NOT Ai(1) AND Ai(2)) OR (Ai(2) AND NOT Ai(3));


end Behavioral;

