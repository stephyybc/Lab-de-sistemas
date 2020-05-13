--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:24:58 05/12/2020
-- Design Name:   
-- Module Name:   C:/Users/sergi/Desktop/VHDL/UpDown4/tb4bits.vhd
-- Project Name:  UpDown4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UpDown4
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
 
ENTITY tb4bits IS
END tb4bits;
 
ARCHITECTURE behavior OF tb4bits IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UpDown4
    PORT(
         D : IN  unsigned(3 downto 0);
         CET : IN  bit;
         CEP : IN  bit;
         CLK : IN  bit;
         PE : IN  bit;
         U_D : IN  bit;
         Q : OUT  unsigned(3 downto 0);
         TC : OUT  bit
        );
    END COMPONENT;
    

   --Inputs
   signal D : unsigned(3 downto 0) := (others => '0');
   signal CET : bit := '0';
   signal CEP : bit := '0';
   signal CLK : bit := '0';
   signal PE : bit := '0';
   signal U_D : bit := '0';

 	--Outputs
   signal Q : unsigned(3 downto 0);
   signal TC : bit;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UpDown4 PORT MAP (
          D => D,
          CET => CET,
          CEP => CEP,
          CLK => CLK,
          PE => PE,
          U_D => U_D,
          Q => Q,
          TC => TC
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
      D<= "1101"; 
		CET<='0'; 
		CEP<='0';
		PE<= '1'; 
		U_D<='1'; 
		
		wait for 10 ns; 
		D<= "1101"; 
		CET<='0'; 
		CEP<='0';
		PE<= '0'; 
		U_D<='1'; 
		
		wait for 50 ns; 
		D<= "1101"; 
		CET<='0'; 
		CEP<='0';
		PE<= '0'; 
		U_D<='0'; 
		 
		
		
		

      wait;
   end process;

END;
