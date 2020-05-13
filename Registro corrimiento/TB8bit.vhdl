--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:35:32 05/04/2020
-- Design Name:   
-- Module Name:   C:/Users/sergi/Desktop/VHDL/Probema2_30/TB8bit.vhd
-- Project Name:  Probema2_30
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Code8bit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB8bit IS
END TB8bit;
 
ARCHITECTURE behavior OF TB8bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Code8bit
    PORT(
         X : IN  bit_vector(7 downto 0);
         Y : OUT  bit_vector(7 downto 0);
         CLR : IN  bit;
         SDL : IN  bit;
         SDR : IN  bit;
         S : IN  bit_vector (1 downto 0);
         CLK : IN  bit
        );
    END COMPONENT;
    

   --Inputs
   signal X : bit_vector(7 downto 0) := (others => '0');
   signal CLR : bit := '0';
   signal SDL : bit := '0';
   signal SDR : bit := '0';
   signal S : bit_vector(1 downto 0) := "00";
   signal CLK : bit := '0';

 	--Outputs
   signal Y : bit_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Code8bit PORT MAP (
          X => X,
          Y => Y,
          CLR => CLR,
          SDL => SDL,
          SDR => SDR,
          S => S,
          CLK => CLK
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period*2;
		CLK <= '1';
		wait for CLK_period*2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		S<= "11"; 
		SDR<='0'; 
		SDL<='0';
		CLR<= '1'; 
		X<= "11101110"; 
		
		wait for 30 ns; 
		S<= "10"; 
		SDR<='0'; 
		SDL<='0';
		CLR<= '1'; 
		X<= "11101110";
		
		wait for 30 ns; 
		S<= "01"; 
		SDR<='0'; 
		SDL<='1';
		CLR<= '1'; 
		X<= "11101110";
		
		wait for 60 ns; 
		S<= "01"; 
		SDR<='0'; 
		SDL<='0';
		CLR<= '0'; 
		X<= "11101110";
		
		
		wait for 30 ns; 
		S<= "00"; 
		SDR<='0'; 
		SDL<='1';
		CLR<= '1'; 
		X<= "11101110";
     

      -- insert stimulus here 

      wait;
   end process;

END;
