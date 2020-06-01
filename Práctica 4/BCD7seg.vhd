library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_bit.all; 


entity BCD7seg is
    Port ( bcd : in  bit_vector (3 downto 0);
           CLK : in  bit;
           Display : out  bit_vector(6 downto 0);
			  anodo : out string (1 to 5));
end BCD7seg;

architecture Behavioral of BCD7seg is

signal state : integer range 0 to 3; 

begin
	process (clk) 
	begin 
		if CLK='1' and CLK'event then 
			state<=state+1; 
		end if; 
	end process; 
	
	process (state)
	begin 
		case bcd is 
			when "0000" => Display <= "0000001"; 
			when "0001" => Display <= "1001111"; 
			when "0010" => Display <= "0010010"; 
			when "0011" => Display <= "0000110"; 
			when "0100" => Display <= "1001100"; 
			when "0101" => Display <= "0100100"; 
			when "0110" => Display <= "0100000"; 
			when "0111" => Display <= "0001111"; 
			when "1000" => Display <= "0000000"; 
			when "1001" => Display <= "0000100"; 
			when "1010" => Display <= "0001000"; 
			when "1011" => Display <= "1100000"; 
			when "1100" => Display <= "0110001"; 
			when "1101" => Display <= "1000010";
			when "1110" => Display <= "0110000"; 
			when "1111" => Display <= "0111000"; 
		end case; 
	
		case State is
			when 0 => 
				Anodo<= "Disp0";  
			when 1 => 
				Anodo<= "Disp1";  
			when 2 => 
				Anodo<= "Disp2"; 
			when 3 =>
				Anodo<= "Disp3"; 
			end case; 
	end process; 
		
end Behavioral;

