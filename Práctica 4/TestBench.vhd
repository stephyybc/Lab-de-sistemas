--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:08:36 05/31/2020
-- Design Name:   
-- Module Name:   C:/Users/sergi/Desktop/VHDL/Decoder7Segment/TestBench.vhd
-- Project Name:  Decoder7Segment
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BCD7seg
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
use ieee.numeric_bit.all; 
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TestBench IS
END TestBench;
 
ARCHITECTURE behavior OF TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BCD7seg
    PORT(
         bcd : IN  bit_vector(3 downto 0);
         CLK : IN  bit;
         Display : OUT  bit_vector(6 downto 0);
			anodo : out string (1 to 5) 
        );
    END COMPONENT;
    

   --Inputs
   signal bcd : bit_vector(3 downto 0) := (others => '0');
   signal CLK : bit := '0';

 	--Outputs
   signal Display : bit_Vector(6 downto 0);
	signal anodo : string (1 to 5); 

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BCD7seg PORT MAP (
          bcd => bcd,
          CLK => CLK,
          Display => Display,
			 anodo => anodo
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      
		bcd<="0000", "0001" after 10 ns, "0010" after 30 ns, "1001" after 50 ns; 

      wait;
   end process;

END;
