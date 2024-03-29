LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
ENTITY tb_topmodule IS
END tb_topmodule;
 
ARCHITECTURE behavior OF tb_topmodule IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Topmodule
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         enblink : IN  std_logic;
         din : IN  std_logic_vector(3 downto 0);
         dout : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal enblink : std_logic := '0';
   signal din : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal dout : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Topmodule PORT MAP (
          clk => clk,
          rst => rst,
          enblink => enblink,
          din => din,
          dout => dout
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
	
	report "Verificando funcionamiento"
	severity note;
      rst<='1';
		wait for clk_period;
		rst<='0';
		wait for 4 ns;
		for i in 0 to 9 loop
			din <= std_logic_vector(to_unsigned(i,4));
			wait for clk_period;
			assert dout(3 downto 0) = din
					report "No activa la salida " & integer'image(i) & " con el correspondiente estimulo dout(3 downto 0)"
						severity error;
			assert dout(7 downto 4) = din
					report "No activa la salida " & integer'image(i) & " con el correspondiente estimulo dout(7 downto 4)"
						severity error;
		end loop;
		wait for 1.5*clk_period;
		enblink<='1';
		wait for 7*clk_period;
		enblink <= '0';
		wait for 20*clk_period;
		enblink<='1';
		wait for 7*clk_period;
		enblink <= '0';
		for i in 0 to 9 loop
			din <= std_logic_vector(to_unsigned(i,4));
			wait for clk_period;
			assert dout(3 downto 0) = din
					report "No activa la salida " & integer'image(i) & " con el correspondiente estimulo dout(3 downto 0)"
						severity error;
			assert dout(7 downto 4) = din
					report "No activa la salida " & integer'image(i) & " con el correspondiente estimulo dout(7 downto 4)"
						severity error;
		end loop;
		report "Verificacion satisfactoria"
		severity note;
		 wait;
   end process;

END;
