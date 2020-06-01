library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Controller is
    Port ( GO : in  std_logic;
           CLK : in  std_logic;
			  RESET : in std_logic; 
			  s : out std_logic_vector(1 downto 0));
end Controller;

architecture Behavioral of Controller is
type State_type is (mux, regist, comparator, subtractor); 
signal present_state : state_type := MUX; 
signal future_state : state_type; 
begin
	process (CLK) 
	begin 
		if rising_edge(CLK) and GO ='1' then  
			if Reset ='1' then present_state<= mux; 
			else present_state<=future_state;
			end if; 
		end if; 
	end process; 
	
	process (present_state)
	begin 
		case present_state is 
			when Mux => 
				s<= "00"; 
				future_state<= regist; 
			
			when regist => 
				s<= "01"; 
				future_state<= comparator; 
			
			when comparator => 
				s<= "10"; 
				future_state<= subtractor; 
				
			when subtractor => 
				s<="11"; 
				future_state<= Mux; 
		end case; 
	end process; 

end Behavioral;

