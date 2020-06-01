library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_bit.all;

entity Datapath is
    Port ( Xi : in  STD_LOGIC_vector(3 downto 0);
           Yi : in  STD_LOGIC_vector (3 downto 0);
			  Oenb : in STD_LOGIC; 
			  SelX, SelY: in STD_LOGIC ; -- MUX
			  XLD, YLD, CLK: in STD_LOGIC; --Register
			  Xsub, Ysub: in STD_LOGIC; --Substractor
			  x_gt_y, x_eq_y, x_lt_y: out std_logic;
           DataO : out  STD_LOGIC_vector(3 downto 0);
			  SSX, SSY: out std_logic_vector (3 downto 0));
			  
end Datapath;

architecture Behavioral of Datapath is
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
 

signal SMX, SMY, SRX, SRY, SubX, SubY: std_logic_vector (3 downto 0);

signal BX, BY: std_logic;
begin
	MUXX: Mux port map (Xi, SubX, SelX, SMX);  
	MUXY: Mux port map (Yi, SubY, SelY, SMY); 
	
	REGX: register4bits port map (SMX, CLK, XLD, '0', SRX); 
	REGY: register4bits port map (SMY, CLK, YLD, '0', SRY); 
	
	
	SUBSX: substractor4bits port map (SRX, SRY, XSUB, BX, SubX);  
	SUBSY: substractor4bits port map (SRY, SRX, YSUB, BY, SubY);
	
	COMP: Comparator port map (SRX, SRY, x_gt_y, x_eq_y, x_lt_y);
	
	REOUT: register4bits port map (SRX, CLK, Oenb, '0', DataO);  
	
	SSX<= SUbx; 
	SSY<= SUBy; 

end Behavioral;



