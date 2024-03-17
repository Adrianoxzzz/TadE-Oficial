library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity Dig_Cronometer is
  port (
    stoptoinit:in std_logic;
    inicio: in std_logic;
    clk: in std_logic;
    rst: in std_logic;
	 cuenta1: out integer range 0 to 25000000;
	 cuenta2: out integer range 0 to 25000000;
	 cuenta3: out integer range 0 to 25000000;
	 cuenta4: out integer range 0 to 25000000;
	 cuenta5: out integer range 0 to 25000000;
	 rco: out std_logic;
	 Qqout: out std_logic_vector(4 downto 0)
  ) ;
end Dig_Cronometer ; 

architecture arch of Dig_Cronometer is
component GenCounter
generic(
    N: integer:=50000000;
    limit: integer:= 59
);
port(
        clk: in std_logic;
        rst: in std_logic;
        cuenta: out integer;
		  pause: in std_logic;
        rco: out std_logic;
        Q: out std_logic
 ) ;
end component;
component Cronometro
port (
    INIT_PAUSE: in std_logic;
    STOP_TO_INIT: in std_logic;
    clk: in std_logic;
    rst: in std_logic;
    q: out std_logic_vector (1 downto 0)
  );
  end component;
signal clk_bus: std_logic_vector(4 downto 0):= (others => '0');
signal rco_bus: std_logic_vector(4 downto 0):= (others => '0');
signal intermedio: std_logic:='0';
signal parar: std_logic:='0';
signal qs: std_logic_vector(1 downto 0);
  begin
fms: Cronometro
port map(
clk => clk,
rst => rst,
q => qs,
INIT_PAUSE => inicio,
STOP_TO_INIT => stoptoinit
);

Cont_seg0: GenCounter
	generic map(
	N =>25000000,
	limit =>10
)
port map(
	clk => clk,
	rst => rst,
	rco => clk_bus(0),
	pause => qs(1),
	cuenta => cuenta1,
	Q => Qqout(0)
);	

Cont_seg1: GenCounter
	generic map(
	N =>25000000,
	limit =>6
)
port map(
	clk => clk_bus(0),
	rst => rst,
	rco => clk_bus(1),
	pause => qs(1),
	cuenta => cuenta2,
	Q => Qqout(1)
);
Cont_seg2: GenCounter
	generic map(
	N =>25000000,
	limit =>10
)
port map(
	clk => clk_bus(1),
	rst => rst,
	rco => clk_bus(2),
	pause => qs(1),
	cuenta => cuenta3,
	Q => Qqout(2)
);	
Cont_seg3: GenCounter
	generic map(
	N =>25000000,
	limit =>6
)
port map(
	clk => clk_bus(2),
	rst => rst,
	rco => clk_bus(3),
	pause => qs(1),
	cuenta => cuenta4,
	Q => Qqout(3)
);	
Cont_seg4: GenCounter
	generic map(
	N =>25000000,
	limit =>10
)
port map(
	clk => clk_bus(3),
	rst => rst,
	rco => rco,
	pause => qs(1),
	cuenta => cuenta5,
	Q => Qqout(4)
);	
end architecture ;