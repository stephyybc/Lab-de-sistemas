--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:59:37 05/12/2020
-- Design Name:   
-- Module Name:   C:/Users/sergi/Desktop/VHDL/Controller/TB.vhd
-- Project Name:  Controller
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LCD
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
use ieee.std_logic_textio.all;

Library std; 
use std.textio.all; 
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB IS
END TB;
 
ARCHITECTURE behavior OF TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LCD
    PORT(
         RESET : IN  bit;
         CLK : IN  bit;
         DATA_INSTRUCTIONS : IN  bit_vector(7 downto 0);
         RS : IN  bit;
         RWDATA : IN  bit;
         Señal_RS : OUT  bit;
         Señal_RW : OUT  bit;
         Señal_EN : OUT  bit;
         DATA : OUT  bit_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RESET : bit := '0';
   signal CLK : bit := '0';
   signal DATA_INSTRUCTIONS : bit_vector(7 downto 0) := (others => '0');
   signal RS : bit := '0';
   signal RWDATA : bit := '0';

 	--Outputs
   signal Señal_RS : bit;
   signal Señal_RW : bit;
   signal Señal_EN : bit;
   signal DATA : bit_vector(7 downto 0);
	
	
   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LCD PORT MAP (
          RESET => RESET,
          CLK => CLK,
          DATA_INSTRUCTIONS => DATA_INSTRUCTIONS,
          RS => RS,
          RWDATA => RWDATA,
          Señal_RS => Señal_RS,
          Señal_RW => Señal_RW,
          Señal_EN => Señal_EN,
          DATA => DATA
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/10;
		CLK <= '1';
		wait for CLK_period/10;
   end process;
 

   -- Stimulus process
   stim_proc: process
	
		file fin: TEXT open READ_MODE is "input.txt"; 
		
		variable current_read_line : line; 
		variable current_read_field : bit_vector (10 downto 0); 
   begin		
      
		while (not endfile(fin)) loop
		
			wait for 100 ns;	
			readline(fin, current_read_line); 
			read(current_read_line, current_read_field); 
			
			RESET<= current_read_field(10); 
			RS<= current_read_field(9); 
			RWDATA<= current_read_field(8); 
			DATA_INSTRUCTIONS<= current_read_field(7 downto 0); 
      

      end loop; 

      wait;
   end process;

END;
