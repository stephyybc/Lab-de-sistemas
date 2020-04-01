--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:10:51 03/22/2020
-- Design Name:   
-- Module Name:   C:/Users/sergi/Desktop/VHDL/Multiplier/Multiplicador.vhd
-- Project Name:  Multiplier
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Multiplier
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
 
ENTITY Multiplicador IS
END Multiplicador;
 
ARCHITECTURE behavior OF Multiplicador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Multiplier
    PORT(
         A : IN  bit_vector(3 downto 0);
         B : IN  bit_vector(3 downto 0);
         Z : OUT bit_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : bit_vector(3 downto 0) := (others => '0');
   signal B : bit_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Z : bit_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplier PORT MAP (
          A => A,
          B => B,
          Z => Z
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      A <= "1011"; 
		B <= "0011"; 
		
		wait for 20 ns;
		A <= "0101"; 
		B <= "0110"; 
		
		wait for 20 ns;
		A <= "0000"; 
		B <= "1111"; 
		
		wait for 20 ns;
		A <= "1111"; 
		B <= "0001"; 
		
		wait for 20 ns;
		A <= "0001"; 
		B <= "0001"; 
		
		wait for 20 ns;
		A <= "0101"; 
		B <= "0011"; 
		

      -- insert stimulus here 

      wait;
   end process;

END;
