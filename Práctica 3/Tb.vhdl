--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:51:16 05/27/2020
-- Design Name:   
-- Module Name:   C:/Users/sergi/Desktop/VHDL/UpDown8bit/Tb.vhd
-- Project Name:  UpDown8bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Counter0_99
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
 
ENTITY Tb IS
END Tb;
 
ARCHITECTURE behavior OF Tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Counter0_99
    PORT(
         D : IN  unsigned(6 downto 0);
         LOAD : IN  bit;
         UP : IN  bit;
         CLK : IN  bit;
         CLR : IN  bit;
         Q : OUT  unsigned(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal D : unsigned(6 downto 0) := (others => '0');
   signal LOAD : bit := '0';
   signal UP : bit := '0';
   signal CLK : bit := '0';
   signal CLR : bit := '0';

 	--Outputs
   signal Q : unsigned(6 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Counter0_99 PORT MAP (
          D => D,
          LOAD => LOAD,
          UP => UP,
          CLK => CLK,
          CLR => CLR,
          Q => Q
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		CLR<='1'; 
		LOAD<='0'; 
		D<="0000000"; 
		UP<='1', '0' after 100 ns; 

      -- insert stimulus here 

      wait;
   end process;

END;
