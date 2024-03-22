
-- VHDL Instantiation Created from source file counter.vhd -- 14:30:59 03/19/2024
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT counter
	PORT(
		i_clk : IN std_logic;
		i_rst : IN std_logic;
		i_en : IN std_logic;
		i_data : IN std_logic_vector(7 downto 0);          
		o_data : OUT std_logic_vector(7 downto 0);
		o_end : OUT std_logic
		);
	END COMPONENT;

	Inst_counter: counter PORT MAP(
		i_clk => ,
		i_rst => ,
		i_en => ,
		i_data => ,
		o_data => ,
		o_end => 
	);


