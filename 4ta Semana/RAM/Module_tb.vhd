--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:22:12 03/24/2024
-- Design Name:   
-- Module Name:   /home/ise/Proyects/FMSS/RAM_memo/RAM_memo/Module_tb.vhd
-- Project Name:  RAM_memo
-- Target Device:  
-- Tool versions:  
-- Description:   

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Module_tb IS
END Module_tb;
 
ARCHITECTURE behavior OF Module_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Module
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         en : IN  std_logic;
         lap_btn : IN  std_logic;
         stp : IN  std_logic;
         din : IN  std_logic_vector(31 downto 0);
         addr : IN  std_logic_vector(7 downto 0);
         dout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal en : std_logic := '0';
   signal lap_btn : std_logic := '0';
   signal stp : std_logic := '0';
   signal din : std_logic_vector(31 downto 0) := (others => '0');
   signal addr : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal dout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Module PORT MAP (
          clk => clk,
          rst => rst,
          en => en,
          lap_btn => lap_btn,
          stp => stp,
          din => din,
          addr => addr,
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
      rst <= '1';
		
		wait for clk_period/2;
		wait for 1 ns;
		
		rst <= '0';
		din <= x"00000001";
		addr <= "00000001";
		lap_btn <= '0';
		en <= '1';
		stp <= '0';
		
		wait for 25 ns;
		
		lap_btn <= '1';
		
		wait for clk_period;
		
		lap_btn <= '0';
		din <= x"00000010";
		addr <= "00000111";
		
		wait for 25 ns;
		
		lap_btn <= '1';
		
		wait for clk_period;
		
		lap_btn <= '0';
		
		wait for clk_period;
		
		addr <= "00000001";
		en <= '0';
		stp <= '1';
		wait for 25 ns;
		
		lap_btn <= '1';
		
		wait for clk_period;
		
		lap_btn <= '0';
		addr <= "00000111";
		
		wait for 25 ns;
		
		lap_btn <= '1';
		
		wait for 2*clk_period;
		
		lap_btn <= '0';
		
      wait;
   end process;

END;
