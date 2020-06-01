----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:16:16 06/01/2020 
-- Design Name: 
-- Module Name:    MCD - Behavioral 
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

entity MCD is
    Port ( GO : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           X : in  STD_LOGIC_vector(3 downto 0);
           Y : in  STD_LOGIC_vector(3 downto 0);
			  State: out string (1 to 7); 
           Data_o : out  STD_LOGIC_vector(3 downto 0));
end MCD;

architecture Behavioral of MCD is

component Datapath is 
	Port ( Xi : in  STD_LOGIC_vector(3 downto 0);
           Yi : in  STD_LOGIC_vector (3 downto 0);
			  Oenb : in STD_LOGIC; 
			  SelX, SelY: in STD_LOGIC ; -- MUX
			  XLD, YLD, CLK: in STD_LOGIC; --Register
			  Xsub, Ysub: in STD_LOGIC; --Substractor
			  x_gt_y, x_eq_y, x_lt_y: out std_logic;
           DataO : out  STD_LOGIC_vector(3 downto 0);
			  SSX, SSY: out std_logic_vector (3 downto 0));
end component; 

signal Xi, Yi : STD_LOGIC_vector(3 downto 0); 
signal SelX, SelY, Oenb : STD_LOGIC; 
signal XLD, YLD : STD_LOGIC; 
signal Xsub, Ysub: STD_LOGIC:= '0'; 
signal x_gt_y, x_eq_y, x_lt_y: std_logic;
signal SSX, SSY : std_logic_vector (3 downto 0); 


type State_type is (mux, regist, comparator, output); 

signal future_state : state_type := MUX; 
begin

	DP: Datapath port map (Xi, Yi, Oenb, SelX, SelY, XLD, YLD, Clk, Xsub, Ysub,x_gt_y, x_eq_y, x_lt_y ,Data_O, SSX, SSY); 
	
	
	process (CLK)
	begin 
	if rising_edge(CLK) then  
		case future_state is 
			when Mux => 
				state<= "State 0"; 
				if GO ='1' then
					 
					if x_gt_y = '1' then 
						selX<='1'; 
						selY<='0'; 
						Xi<= SSX; 
						future_state<= regist;
					elsif x_lt_y ='1' then 
						selX<='0';
						selY<='1';
						Yi<= SSY; 
						future_state<= regist;
					else 
						selX<='0'; 
						selY<='0';
						xi<=X; 
						yi<=Y; 
						future_state<= regist;
					end if; 
				else 
					future_state<= Mux; 
				end if; 
			
			when regist => 
				state<= "State 1"; 
				
				XLD<= '1'; 
				YLD<='1'; 
			   future_state<= comparator; 
			when comparator => 
				state<= "State 2"; 
				 
				XLD<= '0'; 
				YLD<='0';
				future_state<= output;
			when output => 
				state<="State 3"; 			
				if x_eq_y = '1' then 
					Oenb<='1';
				end if; 
				future_state<= Mux; 				
		end case;
		end if; 
	end process; 

end Behavioral;