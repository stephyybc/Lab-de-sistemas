----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:29:45 05/04/2020 
-- Design Name: 
-- Module Name:    Code8bit - Behavioral 
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

entity Code8bit is
    Port ( X : in  bit_vector(7 downto 0);
           Y : out  bit_vector(7 downto 0);
           CLR : in  bit;
           SDL : in  bit;
           SDR : in  bit;
           S : in  bit_vector (1 downto 0);
           CLK : in  bit);
end Code8bit;

architecture Behavioral of Code8bit is
component Code 
	Port ( CLK : in  bit;
           CLR : in  bit;
           SDL : in  bit;
           SDR : in  bit;
           S : in  bit_vector(1 downto 0) ;
           D : in  bit_Vector (3 downto 0);
           Q : out  bit_vector (3 downto 0));
end component; 
signal Aux1, Aux2: bit; 
begin
	RE: Code port map (CLK, CLR, SDL, X(4), S, X(3 downto 0), Y(3 downto 0));  
	RE2: Code port map (CLK, CLR, X(3), SDR, S, X(7 downto 4), Y(7 downto 4));
end Behavioral;

