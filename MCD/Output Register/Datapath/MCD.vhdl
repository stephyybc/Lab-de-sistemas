
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MCD is
    Port ( Xi : in  STD_LOGIC_vector(3 downto 0);
           Yi : in  STD_LOGIC (3 downto 0);
			  SelX, SelY: in STD_LOGIC ; -- MUX
			  XLD, YLD, CLK, RESET: in STD_LOGIC; --Register
			  Xsub, Ysub: STD_LOGIC; --Substractor
           DataO : out  STD_LOGIC(3 downto 0));
end MCD;

architecture Behavioral of MCD is
component Mux is
	port(
        x, y : in std_logic_vector(3 downto 0);
        sel : in std_logic;
        res : out std_logic_vector(3 downto 0)
    );
end component; 

component register4bits is 
	port (
        d_in : in std_logic_vector(3 downto 0);
        clk, load, reset : in std_logic;
        d_out : out std_logic_vector(3 downto 0)
    );
end component; 

component substractor4bits is 
	port(
        a, b : in std_logic_vector(3 downto 0);
        bin :  in std_logic;
        bout : out std_logic;
        d   : out std_logic_vector(3 downto 0)
    );
end component; 

component Comparator is 
	port(
        x, y : in std_logic_vector(3 downto 0);
        x_gt_y, x_eq_y, x_lt_y : out std_logic
    );
end component; 
signal SMX, SMY, SRX, SRY, SSX, SSY: std_logic_vector (3 downto 0);
signal BX, BY, x_gt_y, x_eq_y, x_lt_y: std_logic; 
begin
	MUXX: Mux port map (Xi, SSX, SelX, SMX);  
	MUXY: Mux port map (Yi, SSY, SelY, SMY); 
	
	REGX: register4bits port map (SMX, CLK, XLD, RESET, SRX); 
	REGY: register4bits port map (SMY, CLK, YLD, RESET, SRY); 
	
	SUBX: substractor4bits port map (SRX, SRY, XSUB, BX, SSX); 
	SUBY: substractor4bits port map (SRX, SRY, YSUB, BY, SSY);
	
	COMP: Comparator port map (SRX, SRY, x_gt_y, x_eq_y, x_lt_y);  
	
	REOUT: register4bits port map (SRX, CLK, x_eq_y, RESET, DataO);  

end Behavioral;

