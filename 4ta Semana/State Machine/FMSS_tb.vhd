LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY FMSS_tb IS
END FMSS_tb;
 
ARCHITECTURE behavior OF FMSS_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FMSS
    PORT(
         i_clk : IN  std_logic;
         i_rst : IN  std_logic;
         i_L : IN  std_logic;
         o_P : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i_clk : std_logic := '0';
   signal i_rst : std_logic := '0';
   signal i_L : std_logic := '0';

 	--Outputs
   signal o_P : std_logic;

   -- Clock period definitions
   constant i_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FMSS PORT MAP (
          i_clk => i_clk,
          i_rst => i_rst,
          i_L => i_L,
          o_P => o_P
        );

   -- Clock process definitions
   i_clk_process :process
   begin
		i_clk <= '0';
		wait for i_clk_period/2;
		i_clk <= '1';
		wait for i_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      
		i_rst <='1';
		wait for i_clk_period;
		i_rst <= '0';
		wait for 5 ns;
		
		i_L <= '1';
		wait for 2*i_clk_period;
		i_L <='0';
		wait for i_clk_period;
		i_L <='1';		

      wait;
   end process;

END;
