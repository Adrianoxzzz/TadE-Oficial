LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Multiplier_tb IS
END Multiplier_tb;
 
ARCHITECTURE behavior OF Multiplier_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Multiplier
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         EnBlink : IN  std_logic;
         Din : IN  std_logic_vector(3 downto 0);
         Dout : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal EnBlink : std_logic := '0';
   signal Din : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Dout : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplier PORT MAP (
          clk => clk,
          rst => rst,
          EnBlink => EnBlink,
          Din => Din,
          Dout => Dout
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      
		rst <= '1';
		wait for 3 ns;
		rst <= '0';
		wait for 1.99 ns;
		din <= x"1";
		wait for 9.99 ns;
		din <= x"2";
		wait for 9.99 ns;
		din <= x"3";
		wait for 9.99 ns;
		din <= x"4";
		wait for 9.99 ns;
		din <= x"5";
		wait for 9.99 ns;
		din <= x"6";
		wait for 9.99 ns;
		din <= x"7";
		wait for 9.99 ns;
		EnBlink <= '1' , '0' after 5 ns;
		wait for 10*clk_period;
		EnBlink <= '1' , '0' after 5 ns;
      wait;
   end process;

END;
