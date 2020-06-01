--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:17:31 06/01/2020
-- Design Name:   
-- Module Name:   C:/Users/sergi/Desktop/VHDL/MCD/TB.vhd
-- Project Name:  MCD
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MCD
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
 
ENTITY TB IS
END TB;
 
ARCHITECTURE behavior OF TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MCD
    PORT(
         GO : IN  std_logic;
         CLK : IN  std_logic;
         
         X : IN  std_logic_vector(3 downto 0);
         Y : IN  std_logic_vector(3 downto 0);
         State : OUT  string(1 to 7);
         Data_o : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
 

   --Inputs
   signal GO : std_logic := '0';
   signal CLK : std_logic := '0';
   
   signal X : std_logic_vector(3 downto 0) := (others => '0');
   signal Y : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal State : string(1 to 7);
   signal Data_o : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MCD PORT MAP (
          GO => GO,
          CLK => CLK,
          X => X,
          Y => Y,
          State => State,
          Data_o => Data_o
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
      GO<='1'; 
		X<="0101"; 
		Y<="1010";

      -- insert stimulus here 

      wait;
   end process;

END;
