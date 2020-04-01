----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:42:27 03/22/2020 
-- Design Name: 
-- Module Name:    Multiplier - Behavioral 
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

entity Multiplier is
    Port ( A : in  bit_vector (3 downto 0);
           B : in  bit_vector (3 downto 0);
           Z : out bit_vector (7 downto 0));
end Multiplier;

architecture Behavioral of Multiplier is
component FullAdder
	Port ( A : in  bit;
           B : in  bit;
           Ci : in  bit;
           Z : out  bit;
           Cout : out  bit);
end component; 

component HalfAdder
	Port ( A : in  bit;
           B : in  bit;
           Z : out  bit;
           C : out  bit);
end component; 
signal C: bit_vector(12 downto 0); 
signal S: bit_vector(5 downto 0);  
begin
	Z(0)<= A(0) and B(0); 
	HA0: HalfAdder port map (A(1) and B(0), A(0) and B(1), Z(1), C(0)); 
	FA0: FullAdder port map (A(2)and B(0), A(1) and B(1), C(0), S(0), C(1)); 
	HA1: HalfAdder port map (S(0), A(0) and B(2), Z(2), C(2)); 
	FA1: FullAdder port map (A(3) nand B(0), A(2) and B(1), C(1), S(1), C(3));
	FA2: FullAdder port map (S(1), A(1) and B(2), C(2), S(2), C(4)); 
	HA2: HalfAdder port map (S(2), A(0) nand B(3), Z(3), C(5)); 
	FA3: FullAdder port map ('1', A(3) nand B(1), C(3), S(3), C(6)); 
	FA4: FullAdder port map (S(3), A(2) and B(2), C(4), S(4), C(7)); 
	FA5: FullAdder port map (S(4), A(1) nand B(3), C(5), Z(4), C(8)); 
	FA6: FullAdder port map (C(6), A(3) nand B(2), C(7), S(5), C(9)); 
	FA7: FullAdder port map (S(5), A(2) nand B(3), C(8), Z(5), C(10)); 
	FA8: FullAdder port map (C(9), A(3) and B(3), C(10), Z(6), C(11)); 
	HA3: HalfAdder port map ('1', C(11), Z(7), C(12)); 
end Behavioral;

