--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:55:03 05/04/2020
-- Design Name:   
-- Module Name:   C:/Users/sergi/Desktop/VHDL/BCD/TB8.vhd
-- Project Name:  BCD
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BCD8
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
 
ENTITY TB8 IS
END TB8;
 
ARCHITECTURE behavior OF TB8 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BCD8
    PORT(
         D : IN  bit_vector(7 downto 0);
         CLK : IN  bit;
         CLR : IN  bit;
         LOAD : IN  bit;
         ENT : IN  bit;
         ENP : IN  bit;
         UP : IN  bit;
         CO : OUT  bit;
         Q : OUT  unsigned (7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal D : bit_vector(7 downto 0) := "00000000";
   signal CLK : bit := '0';
   signal CLR : bit := '0';
   signal LOAD : bit := '0';
   signal ENT : bit := '0';
   signal ENP : bit := '0';
   signal UP : bit := '0';

 	--Outputs
   signal CO : bit;
   signal Q : unsigned (7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BCD8 PORT MAP (
          D => D,
          CLK => CLK,
          CLR => CLR,
          LOAD => LOAD,
          ENT => ENT,
          ENP => ENP,
          UP => UP,
          CO => CO,
          Q => Q
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period;
		CLK <= '1';
		wait for CLK_period;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		CLR<='1'; 
		LOAD<='0'; 
		D<= "10011000"; 
		ENT<= '1'; 
		ENP<='1'; 
		UP<='1'; 
		
		wait for 20 ns; 
		CLR<='1'; 
		LOAD<='1'; 
		D<= "10011000"; 
		ENT<= '1'; 
		ENP<='1'; 
		UP<='1';
		
		wait for 60 ns; 
		CLR<='1'; 
		LOAD<='1'; 
		D<= "10011000"; 
		ENT<= '0'; 
		ENP<='1'; 
		UP<='0';
		
		wait for 40 ns; 
		CLR<='1'; 
		LOAD<='1'; 
		D<= "10011000"; 
		ENT<= '1'; 
		ENP<='1'; 
		UP<='0';
		
		wait for 90 ns;
		 
		CLR<='0'; 
		LOAD<='1'; 
		D<= "10011000"; 
		ENT<= '1'; 
		ENP<='1'; 
		UP<='0';	

     

      -- insert stimulus here 

      wait;
   end process;

END;
