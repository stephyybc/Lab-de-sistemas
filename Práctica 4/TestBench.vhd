-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT BCDto7
          PORT(
           Ai : in  bit_vector (3 downto 0);
           A : out  bit;
           B : out  bit;
           C : out  bit;
           D : out  bit;
           E : out  bit;
           F : out  bit;
           G : out  bit);
                  
          END COMPONENT;

          SIGNAL Ai :   bit_vector (3 downto 0):= (others => '0');
          SIGNAL A :   bit;
          SIGNAL B :   bit;
          SIGNAL C :   bit;
          SIGNAL D :   bit;
          SIGNAL E :   bit;
          SIGNAL F :   bit;
          SIGNAL G :   bit;
          

  BEGIN

  -- Component Instantiation
          uut: BCDto7 PORT MAP(
                  Ai => Ai, 
						A => A,
						B => B,
						C => C,
						D => D,
						E => E,
						F => F,
						G => G
          );


  --  Test Bench Statements
     tb : PROCESS
     BEGIN

        wait for 100 ns; -- wait until global set/reset completes
			Ai<="0000";
			wait for 50 ns;
			Ai<="0001"; 
			wait for 50 ns; 
			Ai<="0010";
			wait for 50 ns;
			Ai<="0011"; 
			wait for 50 ns;
			Ai<="0100";
			wait for 50 ns;
			Ai<="0101"; 
			wait for 50 ns; 
			Ai<="0110";
			wait for 50 ns;
			Ai<="0111";
			wait for 50 ns;
			Ai<="1000";
			wait for 50 ns;
			Ai<="1001"; 
			wait for 50 ns; 
			Ai<="1010";
			wait for 50 ns;
			Ai<="1011"; 
			wait for 50 ns;
			Ai<="1100";
			wait for 50 ns;
			Ai<="1101"; 
			wait for 50 ns; 
			Ai<="1110";
			wait for 50 ns;
			Ai<="1111";
        -- Add user defined stimulus here

        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
