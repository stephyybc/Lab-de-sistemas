library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_bit.all; 


entity LCD is 
port(RESET: in bit;
    CLK : in bit;
    
    RS: in bit;
    RWDATA: in bit;
	 DATA_INSTRUCTIONS: in bit_vector(7 downto 0);
	
    Señal_RS: out bit;
    Señal_RW: out bit;
    Señal_EN: out bit; 
    DATA: out bit_Vector(7 downto 0));
end entity LCD;

architecture Behavioral of LCD is
type state is(IDLE,RUN);
signal estado: state;

begin 

process(CLK)
 variable clk_count: integer := 0;
 begin
    if CLK='1' and CLK'event then
        case estado is
            when IDLE=>
				
					 if RESET = '1' then
						Señal_RS <= '0';
						Señal_RW <= '0';
						Señal_EN <= '0';
						DATA<="00000000"; 
						estado <= IDLE;
                elsif RWDATA = '1'  then
						Señal_RS <= RESET;
						Señal_RW <= RWDATA;
						DATA <= DATA_INSTRUCTIONS;
						estado <= RUN;
                else
                
                end if;
            
            when RUN =>
                if(clk_count <= 30) then 
                clk_count := clk_count + 1;
                Señal_EN <= '1';
                estado <= RUN;
                else
                    Señal_EN <= '0';
                    clk_count := 0;
                    estado <= IDLE;
                end if;
            when others => null;
        end case;
    end if;
end process;
end Behavioral;