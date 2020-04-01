----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:46:04 03/31/2020 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter0_99 is
    Port ( CLK : in  bit;
           CLR : in  bit;
           SET : in  bit;
			  Q : out bit_vector (7 downto 0));
end Counter0_99;

architecture Behavioral of Counter0_99 is
component FFJK is
Port ( CLK : in  bit;
           J : in  bit;
           K : in  bit;
           CLR : in  bit;
           SET : in  bit;
           Q : out  bit);
end component; 
signal Q_S: bit_vector (7 downto 0); 
signal J: bit_vector (7 downto 1);  
begin

	J(1)<= Q_S(0) and Q_S(3);
	J(2)<= Q_S(0) and Q_S(1);
	J(3)<= (Q_S(0) and Q_S(3))or (J(2) and Q_S(2));
	J(4) <= Q_S(3); 
	J(5)<= Q_S(4) and Q_S(4);
	J(6)<= Q_S(4) and Q_S(5);
	J(7)<= (Q_S(4) and Q_S(7))or (J(6) and Q_S(6));
	
	FF0: FFJK port map (CLK,'1', '1',CLR, SET, Q_S(0)); 
	FF1: FFJK port map (CLK,J(1),J(1),CLR, SET, Q_S(1));
	FF2: FFJK port map (CLK,J(2),J(2),CLR, SET, Q_S(2));	
	FF3: FFJK port map (CLK,J(3),J(3),CLR, SET, Q_S(3));
	FF4: FFJK port map (CLK,J(4),J(4),CLR, SET, Q_S(4)); 
	FF5: FFJK port map (CLK,J(5),J(5),CLR, SET, Q_S(5));
	FF6: FFJK port map (CLK,J(6),J(6),CLR, SET, Q_S(6));	
	FF7: FFJK port map (CLK,J(7),J(7),CLR, SET, Q_S(7));
	
	Q(0)<= Q_S(0); 
	Q(1)<= Q_S(1); 
	Q(2)<= Q_S(2); 
	Q(3)<= Q_S(3);
	Q(4)<= Q_S(4); 
	Q(5)<= Q_S(5); 
	Q(6)<= Q_S(6); 
	Q(7)<= Q_S(7);
end Behavioral;
