
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY RAM_tb IS
END RAM_tb;
 
ARCHITECTURE behavior OF RAM_tb IS 

 
component RAM is
	generic(
	ADDR_WIDTH : integer := 8;
	DATA_WIDTH : integer := 32
	);
	port(
	clk: in std_logic;
	rst: in std_logic;
	en: in std_logic;
	wr: in std_logic;
	rd:in std_logic;
	din: in std_logic_vector(data_width-1 downto 0);
	addr: in std_logic_vector(addr_width-1 downto 0);
	dout: out std_logic_vector(data_width-1 downto 0)
	);
end component;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal en : std_logic := '0';
   signal wr : std_logic := '0';
   signal rd : std_logic := '0';
   signal din : std_logic_vector(31 downto 0) := (others => '0');
   signal addr : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal dout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM 
	generic map(
	ADDR_WIDTH => 8,
	DATA_WIDTH => 32
	)
	PORT MAP (
          clk => clk,
          rst => rst,
          en => en,
          wr => wr,
          rd => rd,
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
		wait for 50 ns;
		rst <= '0';
		en <= '1';
		wr <= '1';
		rd <= '0';
		addr <= "00000001";
		din <= x"00000001";
		
		wait for 50 ns;
		wr <= '1';
		rd <= '0';
		addr <= "00000010";
		din <= x"00000111";
		
		wait for 50 ns;
		wr <= '0';
		rd <= '1';
		addr <= "00000001";

		wait for 50 ns;
		wr <= '0';
		rd <= '1';
		addr <= "00000010";
      wait;
   end process;
	report_proc: process
	begin
	wait for 50 ns;
	wait on dout;
	wait for 1 ns;
		assert dout = x"00000001" report "Probe1 not passed" severity error;
	wait on dout;
	wait for 1 ns;
		assert dout = x"00000111" report "Probe2 not passed" severity error;
		wait;
	end process;
END;
