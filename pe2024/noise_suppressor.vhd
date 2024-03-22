LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_noise_suppressor IS
END tb_noise_suppressor;
 
ARCHITECTURE behavior OF tb_noise_suppressor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
component noise_suppressor is
    generic(
        g_nClkIgnore : integer := 20 
    );
    port (
        i_clk   : in std_logic;
        i_rst   : in std_logic;
        i_data  : in std_logic;
        o_data  : out std_logic
    );
end component noise_suppressor;
    

   --Inputs
   signal i_clk : std_logic := '0';
   signal i_rst : std_logic := '0';
   signal i_data : std_logic := '0';

 	--Outputs
   signal o_data : std_logic;

   -- Clock period definitions
   constant i_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: noise_suppressor
	generic map(
	g_nClkIgnore =>7
	)
	PORT MAP (
          i_clk => i_clk,
          i_rst => i_rst,
          i_data => i_data,
          o_data => o_data
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
      -- hold reset state for 100 ns.
			i_rst <= '1';
        wait for 3 * i_clk_period;
		  i_rst <= '0';
		  wait for 1 * i_clk_period;
        i_data <= '1';
        wait for 1 * i_clk_period;
			
			i_data <= '0';
			wait for i_clk_period;
			i_data <= '1';
        wait for 1 * i_clk_period;
			i_data <= '0';
			wait for 1 * i_clk_period;
			i_data <= '1';
			wait for 10*i_clk_period;
			if o_data = '0' then
            report "ERROR : No funciona";
        else
            report "PASS : Funciona";
        end if;
			wait for 5*i_clk_period;
			
			i_data <= '0';
			wait for i_clk_period;
			
			i_data <= '1';
        wait for i_clk_period;
		
			i_data <= '0';
			wait for i_clk_period;
			i_data <= '1';
        wait for 1 * i_clk_period;
        wait for 1 * i_clk_period;
      wait for i_clk_period*10;

      wait;
   end process;

END;
